class IssueRecorder

  def initialize(listing, name, release)
    @listing = listing
    @name = name
    @release = release
  end


  def record
    issue = Issue.where(ListingCreateHasher.new(@listing).digest.merge!(:title => @name)).first_or_create
    puts "-=+=- -=+=- -=+=-"
    puts "ISSUE RECORDED: #{issue.title}"
    puts "-=+=- -=+=- -=+=-"
    @release.issues << issue
    unless @listing.main_desc == nil
      series = SeriesRecorder.new(@listing, issue).record
      PublisherRecorder.new(@listing, series).record
    end
  end
end

