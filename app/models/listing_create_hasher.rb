class ListingCreateHasher

  def initialize(listing)
    @listing = listing
    @create_hash = {}
  end

  def digest
    @create_hash[:title] = @listing.full_title
    @create_hash[:description] = @listing.full_desc
    @create_hash[:diamond_no] = @listing.diamd_no
    @create_hash[:stock_no] = @listing.stock_no
    @create_hash[:writer] = @listing.writer
    @create_hash[:artist] = @listing.artist
    @create_hash[:cover_artist] = @listing.cover_artist
    #integers
    @create_hash[:issue_no] = @listing.issue_no.to_i
    @create_hash[:max_issue] = @listing.max_issue.to_i
    #float
    @create_hash[:price] = @listing.price.gsub("S", "").to_f
    return @create_hash
  end
end
