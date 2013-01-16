#require "rubygems"
#require "bundler/setup"
require "net/http"
require "open-uri"

class Scraper
  BACKLOG_ARRAY = [
    ["/Downloads/Archives/monthlytools/previews_master_data_file/MasterDataFile-Items_201210.txt","/Downloads/Archives/monthlytools/previews_product_copy/previewsDB_201210.TXT"],
    ["/Downloads/Archives/monthlytools/previews_master_data_file/MasterDataFile-ITEMS_201209.txt", "/Downloads/Archives/monthlytools/previews_product_copy/previewsDB_201209.TXT"],
    ["/Downloads/Archives/monthlytools/previews_master_data_file/MasterDataFile-ITEMS_201208.txt", "/Downloads/Archives/monthlytools/previews_product_copy/previewsDB_201208.TXT"],
    ["/Downloads/Archives/monthlytools/previews_master_data_file/MasterDataFile-ITEMS_201211.txt", "/Downloads/Archives/monthlytools/previews_product_copy/previewsDB_201211.TXT"],
              ]


  #def  agent = LoginAgent.new.login
    #agent = Mechanize.new
    #page = agent.get(ENV['LOGIN'])
    #form = page.form
    #form.UserName =  ENV['USERNAME']
    #form.EnteredCustNo =  ENV['CUST_NO']
    #form.Password =  ENV['PASSWORD']
    #page = agent.submit(form)
    #page = agent.page.links_with(:text => "Data Files")[0].click
    #return agent
  #end

  #Take the 'Master Data File' string and make it a hash of headers => data
  #def master_hasher(file)
    #master_array = file.split("\r\n")
    #keys = master_array[0].split("\t")
    #finished_array = []
    #master_array.each do |row|
      #next if row.split("\t").size != 42
      #next if row.split("\t") == keys
      #finished_array << Hash[keys.zip(row.split("\t"))]
    #end
    #finished_array
  #end

  #take the previewsDB string and make it into a hash of Diamond_numbers => fluff

  #def db_hasher(file)
    #Hash[file.split("\r\n").map { |x| x.gsub("\"", "").split("\t") }.map {|row| [row[0], row[3]]}]
  #end

  #merge the above two into a unified hash
  #def d_parse(master, db)
    #hash_array = MasterHasher.new(master).digest
    #preview_hash = DbHasher.new(db).digest
    #total_hash = {}
    #hash_array.each do |hash|
      #hash["FULL_DESC"]  = preview_hash[hash["DIAMD_NO"]]
      #total_hash.merge!(hash["DIAMD_NO"] => hash )
    #end
    #total_hash
  #end

  def previews_backlog(array)
    agent = LoginAgent.new.login.links_with(:text => "Data Files")[0].click
    total_hash = {}
    puts "Getting Backlog"
    master_page = agent.get("#{ENV['BASE_URL']}/Downloads/Archives/monthly_tools/previews_master_data_file")
    db_page = agent.get("#{ENV['BASE_URL']}/Downloads/Archives/monthly_tools/previews_product_copy")
    puts array[0]
    puts array[1]
    master_link = master_page.links_with(:href => array[0])[0]
    db_link = db_page.links_with(:href => array[1])[0]
    if db_link.nil? or master_link.nil?
    puts "==============WOOPS----------------"
    bext
    end
    total_hash.merge! SourceWeaver.new(master_link.click.body, db_link.click.body).digest
    puts total_hash.size
    return total_hash
  end

  def new_previews
    page = LoginAgent.new.login.links_with(:text => "Data Files")[0].click
    total_hash = {}
    url = ["/FileExport/Misc/MasterDataFile-ITEMS.txt","/FileExport/MonthlyToolsTXT/previewsDB.txt"]
    #puts "Just the New Stuff"
    master_page = page
    db_page = page
    total_hash.merge! SourceWeaver.new(master_page.links_with(:href =>url[0])[0].click.body, db_page.links_with(:href => url[1])[0].click.body).digest
    total_hash
  end

  def rebrand(hash)
    new_hash = {}
    hash.keys.each do |key|
      keyvalue = hash[key].to_s.unpack("C*").pack("U*")
      if key == "INCREMENT"
        new_hash[:increment_no] = keyvalue
      else
        new_hash[key.parameterize.underscore.to_sym] = keyvalue
      end
    end
    new_hash
  end

  def scrape(hash)
    hash.keys.map do |key|
      rebrand(hash[key])
    end
  end

  #going to reincorporate during the "make diamond into a thing" part
  #hash[key].merge!("IMG_URL" => get_imgurl(hash[key]["STOCK_NO"]) )

  def record_previews(preview_hash)
    @p = Preview.create
    preview_hash.each_with_index do |listing, i|
        if i == 0
          @p.first_diamd_no = listing[:diamd_no]
          @p.save
        end
      list = Listing.create listing
      list.preview = @p
      list.save
      puts "#{list.full_title} Recorded"
        if i == preview_hash.size - 1
          @p.last_diamd_no = listing[:diamd_no]
          @p.save
        end
    end
    puts "#Previews recorded, Range: #{@p.first_diamd_no} - #{@p.last_diamd_no}"
  end
  def get_previews
    preview_hash = scrape(new_previews)
    record_previews(preview_hash)
  end

  def get_backlog
    BACKLOG_ARRAY.each do |log|
      preview_hash = scrape(previews_backlog(log))
      record_previews(preview_hash)
    end
  end
end
