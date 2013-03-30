class PreviewsDigester

  attr_reader :name, :previews
  attr_writer :name

  def initialize(previews)
    @previews = previews
    @name = "XxXxXxXxXxXxXxXxXxX"
  end

  def digest
    previews.listings.each do |listing|
      name = ListingDigester.new(listing, name).digest
    end
    pp "Previews Digested"
    previews.digested = true
    previews.save
  end
end
