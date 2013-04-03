class ListingCreateHasher

  attr_reader :listing
  def initialize(listing)
    @listing = listing
  end

  def create_hash
    @_create_hash ||= {}
  end

  def digest
    create_hash[:title] = TitleStripper.new(listing.full_title, listing.variant_desc).strip
    create_hash[:description] = listing.full_desc
    create_hash[:diamond_no] = listing.diamd_no
    create_hash[:stock_no] = listing.stock_no
    create_hash[:writer] = CreatorNormalizer.new(listing.writer).format
    create_hash[:artist] = CreatorNormalizer.new(listing.artist).format
    create_hash[:cover_artist] = CreatorNormalizer.new(listing.cover_artist).format
    #integers
    create_hash[:issue_no] = listing.issue_no.to_i
    create_hash[:max_issue] = listing.max_issue.to_i
    #float
    create_hash[:price] = listing.price.gsub("S", "").to_f
    return create_hash
  end
end
