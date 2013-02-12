class ShippingRowUpdater

  def initialize(doc)
    @doc = doc
  end

  def get_row
    PopupHasher.new(@doc).to_hash["Est Ship Date"]
  end

  def format_date
    DateTime.strptime(get_row, "%m/%d/%Y")
  end
end
