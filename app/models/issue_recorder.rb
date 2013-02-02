class IssueRecorder

  def initialize(listing, name, release)
    @listing = listing
    @name = name
    @release = release
  end

  def series_publsiher_record
    unless @listing.main_desc == nil
      SeriesRecorder.new(@listing, issue).record
      PublisherRecorder.new(@listing, issue).record
    end
  end

  def record
    issue = Issue.where(ListingCreateHasher.new(@listing).digest.merge!(:title => @name)).first_or_create
    @release.issues << issue
    series_publisher_record
  end
end

