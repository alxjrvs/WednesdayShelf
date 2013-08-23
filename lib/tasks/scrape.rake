namespace :scrape do

  task imminent: :environment do
    CbNitride.qualified? ? agent = CbNitride::DiamondLogin.agent : agent = Mechanize.new
    generate_imminent_diamond_numbers.map do |diamond_number|
      if recorded? diamond_number
        puts "Already recorded"
      else
        puts "Looking for #{diamond_number}"
        diamond_item = CbNitride.item(diamond_number, agent: agent || nil)
        ItemUplifter.uplift diamond_item
      end
    end
  end

  task everything: :environment do
    generate_all_diamond_numbers.flatten.map do |diamond_number|
      if recorded? diamond_number
        puts "Already recorded."
      else
        diamond_item = item(diamond_number)
        ItemUplifter.uplift diamond_item
      end
    end.flatten
  end

  def recorded?(diamond_number)
    (Issue.where(diamond_number: diamond_number).size > 0 || Variant.where(diamond_number: diamond_number).size > 0 || DiamondItem.where(diamond_number: diamond_number).size > 0)
  end

  def generate_imminent_diamond_numbers
    @_generate_imminent_diamond_numbers ||= CbNitride::DiamondNumberSet.generate_imminent_diamond_numbers
  end

  def generate_all_diamond_numbers
    @_generate_all_diamond_numbers ||= CbNitride::DiamondNumberSet.generate_all_diamond_numbers
  end
end
