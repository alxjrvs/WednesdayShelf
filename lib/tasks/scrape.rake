namespace :scrape do

  task imminent: :environment do
    sort_through_and_record(imminent_diamond_numbers)
  end

  task recent: :environment do
    sort_through_and_record(recent_diamond_numbers)
  end

  def sort_through_and_record(numbers)
    numbers.each.with_index do |diamond_number, i|
      trash_cb_agent if i % 307 == 0
      record_item(diamond_number)
    end
    return nil
  end

  def record_item(diamond_number)
    puts "Looking for #{diamond_number}"
    diamond_item = CbNitride.item(diamond_number, agent: cb_agent)
    return ItemUplifter.uplift diamond_item
  end

  def imminent_diamond_numbers
    @_imminent_diamond_numbers ||= CbNitride::DiamondNumberSet.generate_imminent_diamond_numbers
  end

  def recent_diamond_numbers
    @_recent_diamond_numbers ||= CbNitride::DiamondNumberSet.generate_recent_diamond_numbers
  end

  def trash_cb_agent
    puts "TRASHING THE AGENT"
    @_cb_agent = nil
  end

  def cb_agent
    @_cb_agent ||= CbNitride.qualified? ? agent = CbNitride::DiamondLogin.agent : agent = Mechanize.new
  end
end
