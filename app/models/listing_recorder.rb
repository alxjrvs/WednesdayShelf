class ListingRecorder

  def initialize(listing, preview)
    @listing = listing
    @preview = preview
  end

  def create_list
    @listing = Listing.create(@listing)
  end

  def state_title
    puts "#{@listing.full_title} Recorded"
  end

  def record
    create_list
    @listing.preview = @preview
    @listing.save
    state_title
  end
end
