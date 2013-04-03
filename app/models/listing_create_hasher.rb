class ListingCreateHasher

  attr_reader :listing
  def initialize(listing)
    @listing = listing
  end

  def create_hash
    @_create_hash ||= {}
  end

  def title
    @_title ||= TitleStripper.new(listing.full_title, listing.variant_desc).strip
  end

  def writer
    @_writer ||= CreatorNormalizer.new(listing.writer).format
  end

  def artist
    @_artist ||= CreatorNormalizer.new(listing.artist).format
  end

  def cover_artist
    @_cover_artist ||= CreatorNormalizer.new(listing.cover_artist).format
  end

  def price
    @_price ||= listing.price.gsub("S", "").to_f
  end

  def digest
    create_hash[:title] = title
    create_hash[:description] = listing.full_desc
    create_hash[:diamond_no] = listing.diamd_no
    create_hash[:stock_no] = listing.stock_no
    create_hash[:writer] = writer
    create_hash[:artist] = artist
    create_hash[:cover_artist] = cover_artist
    create_hash[:issue_no] = listing.issue_no.to_i
    create_hash[:max_issue] = listing.max_issue.to_i
    create_hash[:price] = price
    return create_hash
  end
end
