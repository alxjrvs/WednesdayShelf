class ListingFilter

  def initialize(listing)
    @listing = listing
  end

  def is_comic?
    return false if @listing.publisher == ""
    return false if @listing.price.gsub("$", "").to_f > 10.00
    return false if @listing.full_title.include? " TP"
    return false if @listing.full_title.include? " HC"
    return true
  end
end
