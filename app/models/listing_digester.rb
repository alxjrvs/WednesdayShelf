class ListingDigester

  def initialize(listing, name)
    @listing = listing
    @ship_date = DateTime.strptime(listing.ship_date, "%m/%d/%Y")
    @release = Release.where(:ship_date => @ship_date).first_or_create
    @name = name
  end

  def is_variant?
    if @listing.full_title.include? @name
      return true
    else
      return false
    end
  end

  def title_stripper
    @name = TitleStripper.new(@listing.full_title).strip
  end

  def digest
    if is_variant?
      VariantRecorder.new(@listing, @name).record
    else
      title_stripper
      IssueRecorder.new(@listing, @name, @release).record
    end
    return @name
  end
end
