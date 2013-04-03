class ListingDigester

  attr_reader :listing

  def initialize(listing)
    @listing = listing
  end

  def ship_date
    @_ship_date ||= DateTime.strptime(listing.ship_date, "%m/%d/%Y")
  end

  def release
    @_release ||= Release.where(ship_date: ship_date).first_or_create
  end

  def digest
    if listing.is_comic?
      title = TitleStripper.new(listing.full_title, listing.variant_desc).strip
      unless Issue.where(title: title).empty?
        release << IssueRecorder.new(listing).record
      else
        VariantRecorder.new(listing).record
      end
    else
       pp "#{listing.full_title} is Not A Comic"
    end
  end
end
