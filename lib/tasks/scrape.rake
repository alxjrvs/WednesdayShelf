namespace :scrape do

  task imminent_fast: :environment do
    sort_and_record_fast(imminent_diamond_numbers)
  end

  task recent_fast: :environment do
    sort_and_record_fast(recent_diamond_numbers)
  end

  task imminent: :environment do
    sort_and_record(imminent_diamond_numbers)
  end

  task recent: :environment do
    sort_and_record(recent_diamond_numbers)
  end

  def sort_and_record(numbers)
    numbers.each do |diamond_number|
      record_item(diamond_number)
    end
    return nil
  end

  def sort_and_record_fast(numbers)
    numbers.each do |diamond_number|
      if recorded?(diamond_number)
        puts "Already recorded"
      else
        record_item(diamond_number)
      end
    end
    return nil
  end

  def recorded?(diamond_number)
    DiamondItem.where(diamond_number: diamond_number).count > 0
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
    @_cb_agent ||= CbNitride.qualified? ? CbNitride::DiamondLogin.agent : Mechanize.new
  end
end
