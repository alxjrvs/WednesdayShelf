class PublisherRecorder

  def initialize(listing, issue)
    @listing = listing
    @issue = issue
  end

  def record
    Publisher.where(:name => @listing.publisher).first_or_create << @issue
  end
end
