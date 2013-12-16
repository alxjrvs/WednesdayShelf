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
    elsif item.product_type? == :collection || item.product_type? == :merchandise
      collection_merch_response(item)
    else
      issue_response(item)
    end
  end

  private

  def nil_response(item)
    DiamondItem.create(diamond_number: item.diamond_number, valid_diamond_number: false)
    pp "Invalid Diamond Number"
  end

  def collection_merch_response(item)
      pp "#{item.title} is Merch or a Graphic Novel"
      pp "Not Currently Collecting Merchandise or Graphic Novels"
      record_diamond_item(item)
  end

  def issue_response(item)
      return nil if item.series_title[0..2] == "DF "
      if item.product_type? == :issue
        record_issue(item)
      else
        record_diamond_item(item)
      end
       record_cover(item)
  end

  def record_diamond_item(item)
    DiamondItem.create(diamond_number: item.diamond_number, valid_diamond_number: true)
    puts "Recorded Diamond Item #{item.diamond_number}"
  end

  def record_issue(item)
    IssueUplifter.uplift!(item)
    puts "Recorded #{item.title} (#{item.diamond_number})"
  end

  def record_cover(item)
    CoverUplifter.uplift!(item)
    puts "Recorded Cover for #{item.title} (#{item.diamond_number})"
  end

end
