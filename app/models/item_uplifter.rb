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
      nil_response(item)
    elsif undesireable?(item)
      nil_response(item)
    else
      record(item)
    end
  end

  private

  def nil_response(item)
    DiamondItem.create(diamond_number: item.diamond_number, valid_diamond_number: false)
    pp "Invalid Diamond Number"
  end

  def record(item)
    diamond_item = record_diamond_item(item)
    record_issue(diamond_item) if diamond_item.product_type? == DiamondItem::ProductTypes::ISSUE_CODE
    record_cover(diamond_item, item.image) if diamond_item.product_type? == (DiamondItem::ProductTypes::ISSUE_CODE || DiamondItem::ProductTypes::VARIANT_CODE)
  end

  def record_diamond_item(item)
    DiamondUplifter.uplift!(item)
  end

  def record_cover(diamond_item, image)
    CoverUplifter.uplift!(diamond_item, image)
  end

  def record_issue(diamond_item)
    IssueUplifter.uplift!(diamond_item)
  end

  def undesireable?(item)
    item.raw_title.match(/(^(DF)\s)/) ||
      item.release_date.nil?
  end

end
