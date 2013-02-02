class IssueRecorder

  def initialize(listing, name, release)
    @listing = listing
    @name = name
    @release = release
  end

  def has_series?
    if @listing.main_desc == nil
      return false
    else
      return true
    end
  end

  def record
    issue = Issue.where(ListingCreateHasher.new(@listing).digest.merge!(:title => @name)).first_or_create
    @release.issues << issue
    if has_series?
      SeriesRecorder.new(@listing, issue).record
      PublisherRecorder.new(@listing, issue).record
    end
  end
end

