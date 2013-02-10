class SeriesRecorder

  def initialize(listing, issue)
    @listing = listing
    @issue = issue
  end

  def record
    series = Series.where(:name => @listing.main_desc).first_or_create
    series.issues << @issue
    return series
  end

end
