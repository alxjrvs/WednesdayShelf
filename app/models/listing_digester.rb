class ListingDigester

  attr_reader :listing, :name

  def initialize(listing, name)
    @listing = listing
    @name = name
  end

  def ship_date
    @_ship_date ||= DateTime.strptime(listing.ship_date, "%m/%d/%Y")
  end

  def release
    @_release ||= Release.where(ship_date: ship_date).first_or_create
  end

  def is_variant?
    if listing.full_title.include? name
      return true
    else
      return false
    end
  end

  def title_stripper
    TitleStripper.new(listing.full_title).strip
  end

  def digest
    if listing.is_comic?
      if is_variant?
        VariantRecorder.new(listing, name).record
      else
        name = title_stripper
        IssueRecorder.new(listing, name, release).record
      end
    else
       pp "#{listing.full_title} is Not A Comic"
    end
    return name
  end
end
