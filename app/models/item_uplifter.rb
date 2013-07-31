class ItemUplifter
  # 7/30/13
  # V'ger

  attr_reader :item

  def self.uplift(item)
    new.(item).uplift
  end

  def initialize(item)
    @item = item
  end

  def uplift
    if item.nil?
      pp "Invalid Diamond Number"
      return nil
    elsif item.product_type? :collection || :merchandise
      pp "Not Currently Collecting Merchandise of Graphic Novels"
      return nil
    else
    send(item.product_type)
    end
  end

  private

  def issue
    @_issue ||= Issue.uplift(item)
  end

  def variant
    @_variant ||= Variant.uplift(item)
  end
end
