class PreviewsBacklogger

  def initialize(array)
    @array = array
    @agent = LoginAgent.new.login
    @master_link = @agent.get("#{ENV['BASE_URL']}/Downloads/Archives/monthly_tools/previews_master_data_file").links_with(:href => @array[0])[0]
    @db_link= @agent.get("#{ENV['BASE_URL']}/Downloads/Archives/monthly_tools/previews_product_copy").links_with(:href => @array[1])[0]
    @total_hash = {}
  end

  def state_content
    puts @array[0]
    puts @array[1]
  end

  def check_for_links
    if @db_link.nil? or @master_link.nil?
      puts "No appropriate links"
      return false
    else
      return true
    end
  end

  def digest
    state_content
    if check_for_links
      @total_hash.merge! SourceWeaver.new(@master_link.click.body, @db_link.click.body).digest
      puts @total_hash.size
      return @total_hash
    else
      return false
    end
  end
end
