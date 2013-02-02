class SeriesRecorder

  def initialize(listing, issue)
    @listing = listing
    @issue = issue
  end

  def record
    Series.where(:name => @listing.main_desc).first_or_create << @issue
  end

end
