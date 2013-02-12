class PreviewsDigester

  def initialize(previews)
    @previews = previews
    @name = "Alex Mother Loving Jarvis 12341234"
  end

  def digest
    @previews.listings.each do |listing|
      if listing.is_comic?
        @name = ListingDigester.new(listing, @name).digest
      else
         pp "#{listing.full_title} is Not A Comic"
      end
    end
    pp "Previews Digested"
    @previews.digested = true
    @previews.save
  end
end
