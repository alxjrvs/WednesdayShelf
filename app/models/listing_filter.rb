class ListingFilter

  def initialize(listing)
    @listing = listing
  end

  def is_comic?
    return false if @listing.category != "1"
    #return false if @listing.publisher == ""
    #return false if @listing.writer== "N/A"
    #return false if @listing.cover_artist == "N/A"
    #return false if @listing.artist == ""
    #return false if @listing.price.gsub("$", "").to_f >= 8.99
    #return false if @listing.full_title.include? " SC"
    #return false if @listing.full_title.include? " TP"
    #return false if @listing.full_title.include? " GN "
    #return false if @listing.full_title.include? " VOL "
    #return false if @listing.full_title.include? " HC"
    #return false if @listing.ship_date == ""
    return true
  end
end
