class IssueRecorder

  attr_reader :listing
  def initialize(listing)
    @listing = listing
  end

  def create_hash
    @_create_hash ||= ListingCreateHasher.new(listing).digest
  end


  def issue
    @_issue = Issue.where(create_hash).first_or_create
  end

  def record
    issue
    puts "-=+=- -=+=- -=+=-"
    puts "ISSUE RECORDED: #{issue.title}"
    puts "-=+=- -=+=- -=+=-"
    unless listing.main_desc == nil
      record_series
      record_publisher
    end
    return issue
  end

  def series
    @_series ||= Series.where(name: listing.main_desc).first_or_create
  end

  def publisher
    @_publisher ||= Publisher.where(name: listing.publisher).first_or_create
  end

  def record_publisher
    publisher.series << series
  end

  def record_series
    series.issues << issue
  end
end

