class DiamondUplifter
  include Concerns::Uplifting

  def self.uplift!(item)
    generate_diamond_item(item)
  end

  private

  def self.generate_diamond_item(item)
    diamond_item = DiamondItem.where(diamond_number: item.diamond_number).first_or_create.tap do |diamond_item|
      diamond_item.raw_title = item.raw_title
      diamond_item.category_code = item.category_code
      diamond_item.publisher = item.publisher
      diamond_item.stock_number = item.stock_number
      diamond_item.release_date = item.release_date
      diamond_item.diamond_number = item.diamond_number
      diamond_item.description = item.description
      diamond_item.creators = item.creators
      diamond_item.price = item.price
      diamond_item.state = item.state
      diamond_item.valid_diamond_number = true
    end
    puts "Recorded Diamond Item for #{item.diamond_number}, Title: #{item.raw_title}" if diamond_item.save
    diamond_item
  end

  def self.new_generate_diamond_item(item)
    diamond_item = DiamondItem.where(diamond_number: item.diamond_number).first_or_initialize
    diamond_item.attributes(item.attributes)
    diamond_item.save
    puts "Recorded Diamond Item for #{item.diamond_number}, Title: #{item.raw_title}" if diamond_item.save
    diamond_item
  end

end
