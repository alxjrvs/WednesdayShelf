class PreviewsBacklogger

  def initialize(array)
    @array = array
    @agent = MASTER_LOGIN.agent
  end

  def state_content
    puts @array[0]
    puts @array[1]
  end
  def get_links
    Hash[:master => @agent.get("#{ENV['BASE_URL']}/Downloads/Archives/monthly_tools/previews_master_data_file").links_with(:href => @array[0])[0], :db => @agent.get("#{ENV['BASE_URL']}/Downloads/Archives/monthly_tools/previews_product_copy").links_with(:href => @array[1])[0]]
  end

  def check_for_links
    if get_links[:master].nil? or get_links[:db].nil?
      puts "No appropriate links"
      return false
    else
      return true
    end
  end

  def digest
    state_content
    if check_for_links
       Hash[SourceWeaver.new(get_links[:master].click.body, get_links[:db].click.body).digest]
    end
  end
end
