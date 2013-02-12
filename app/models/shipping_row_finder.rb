class ShippingRowFinder

  def initialize(doc)
    @doc = doc
  end

  def get_row
    PopupToHasher.new(@doc).to_hash
    #@doc.search("[text()*='Est Ship Date']")[0].parent.parent.css('.LookupItemData_Value').text.strip
  end

  def format_date
    DateTime.strptime(get_row, "%m/%d/%Y")
  end
end
