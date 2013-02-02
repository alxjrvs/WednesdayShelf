class PreviewsDigester

  def initialize(previews)
    @previews = previews
    @name = "Alex Mother Loving Jarvis 12341234"
  end

  def digest
    @previews.listings.each do |listing|
      next unless listing.is_comic?
      ld = ListingDigester.new(listing, @name)
      @name = ld.name
    end
    pp "Previews Digested"
    @previews.digested = true
    @previews.save
  end
end
