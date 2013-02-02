class ListingDigester

  attr_reader :name

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
  def has_series?
    if @listing.main_desc == nil
      return false
    else
      return true
    end
  end

  def digest
    if is_variant?
      VariantRecorder.new(listing).record
    else
      @name = TitleStripper.new(@listing.full_title).strip
      issue = Issue.where(ListingCreateHasher.new(@listing).digest.merge!(:title => @name)).first_or_create
      @release.issues << issue
      if has_series?
        series = Series.where(:name => @listing.main_desc ).first_or_create
        series.issues << issue
        publisher = Publisher.where(:name => @listing.publisher).first_or_create
        publisher.series << series
      end
    end
  end

end
