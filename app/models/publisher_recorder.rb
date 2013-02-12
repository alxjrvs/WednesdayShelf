class PublisherRecorder

  def initialize(listing, series)
    @listing = listing
    @series = series
  end

  def record
    Publisher.where(:name => @listing.publisher).first_or_create.series << @series
  end
end
