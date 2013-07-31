namespace :scrape do

  task imminent: :environment do
    agent = CbNitride::DiamondLogin.agent if CbNitride.qualified?
    generate_imminent_diamond_numbers.map do |diamond_number|
      puts "Looking for #{diamond_number}"
      diamond_item = CbNitride.item(diamond_number, agent: agenti || nil)
      if diamond_item.nil?
        next 'Invalid diamond item'
      else
        puts "Recorded #{diamond_item.title} (#{diamond_number})"
        ItemUplifter.uplift diamond_item
      end
    end
  end

  task everything: :environment do
    generate_all_diamond_numbers.flatten.map do |diamond_number|
      diamond_item = item(diamond_number)
      if diamond_item.nil?
        puts "invalid diamond Item"
        next
      else
        puts "Recorded #{diamond_item.title} (#{diamond_number})"
        ItemUplifter.uplift diamond_item
      end
    end.flatten
  end

  def generate_imminent_diamond_numbers
    @_generate_imminent_diamond_numbers ||= CbNitride::DiamondNumberSet.generate_imminent_diamond_numbers
  end

  def generate_all_diamond_numbers
    @_generate_all_diamond_numbers ||= CbNitride::DiamondNumberSet.generate_all_diamond_numbers
  end
end
