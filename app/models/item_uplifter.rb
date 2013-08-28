class ItemUplifter
  # 7/30/13
  # V'ger

  attr_reader :item

  def self.uplift(item)
    new(item).uplift
  end

  def initialize(item)
    @item = item
  end

  def uplift
    if item.nil?
      pp "Invalid Diamond Number"
      return nil
    elsif item.product_type? == :collection || item.product_type? == :merchandise
      pp "#{item.title} is Merch or a Graphic Novel"
      pp "Not Currently Collecting Merchandise or Graphic Novels"
      DiamondItem.create(diamond_number: item.diamond_number)
      return nil
    else
      return nil if item.series_title[0..2] == "DF "
      send(item.product_type?)
      puts "Recorded #{item.title} (#{item.diamond_number})"
    end
  end

  private

  def fitler_for_df(item)
   if item.series_title[0..2] == "DF "
     binding.pry
     item.series_title = item.series_title.gsub("DF ", "").strip
   end
  end

  def issue
    @_issue ||= Issue.uplift!(item)
  end

  def variant
    @_variant ||= Variant.uplift!(item)
  end
end
