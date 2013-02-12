class PopupHasher

  def initialize(doc)
    @doc = doc
  end

  def to_hash
   @doc.css('.LookupItemData_Item').map do |l| 
      Hash[l.css('.LookupItemData_Label').text.strip => l.css('.LookupItemData_Value').text.strip]
    end.reduce Hash.new, :merge
  end
end
