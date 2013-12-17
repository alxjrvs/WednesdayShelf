class DiamondUplifter
  include Concerns::Uplifting

  ATTRIBUTES = :raw_title, :category_code, :publisher, :stock_number, :release_date, :diamond_number, :description, :creators, :price, :state

  def self.uplift!(source)
    generate_diamond_item(source)
  end

  private

  def self.generate_diamond_item(source)
    diamond_item = DiamondItem.where(diamond_number: source.diamond_number).first_or_initialize
    unless same_records?(diamond_item.attributes, get_attributes(source))
      diamond_item.attributes = get_attributes(source)
      diamond_item.save
    end
    puts "Recorded Diamond Item for #{diamond_item.diamond_number}, Title: #{diamond_item.raw_title}"
    return diamond_item
  end

end
