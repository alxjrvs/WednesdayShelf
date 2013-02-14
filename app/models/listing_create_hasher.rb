class ListingCreateHasher

  def initialize(listing)
    @listing = listing
    #@popup_hash = PopupHasher.new(listing.diamd_no).to_hash
    @create_hash = {}
  end

  def digest
    @create_hash[:title] = @listing.full_title
    @create_hash[:description] = @listing.full_desc
    @create_hash[:diamond_no] = @listing.diamd_no
    @create_hash[:stock_no] = @listing.stock_no
    @create_hash[:writer] = CreatorNormalizer.new(@listing.writer).format
    @create_hash[:artist] = CreatorNormalizer.new(@listing.artist).format
    @create_hash[:cover_artist] = CreatorNormalizer.new(@listing.cover_artist).format
    #integers
    @create_hash[:issue_no] = @listing.issue_no.to_i
    @create_hash[:max_issue] = @listing.max_issue.to_i
    #float
    @create_hash[:price] = @listing.price.gsub("S", "").to_f
    return @create_hash
  end
end
