class PreviewsDigester

  def initialize(previews)
    @previews = previews
    @name = "Alex Mother Loving Jarvis 12341234"
  end

  def digest
    @previews.listings.each do |listing|
      @name = ListingDigester.new(listing, @name).digest if listing.is_comic?
    end
    pp "Previews Digested"
    @previews.digested = true
    @previews.save
  end
end
