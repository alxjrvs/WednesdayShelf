class ListingFilter

  def initialize(listing)
    @listing = listing
  end

  def is_comic?
    case @listing.category
    when "1"
      return true
    else
      return false
    end
  end
end
