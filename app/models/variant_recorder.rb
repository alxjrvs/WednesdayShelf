class VariantRecorder

  attr_reader :listing
  def initialize(listing)
    @listing = listing
  end
  
  def create_hash
    @_create_hash = ListingCreateHasher.new(listing).digest.merge!(title: listing.variant_desc)
  end

  def title
    @_title ||= TitleStripper.new(listing.full_title, listing.variant_desc).strip
  end

  def record
    var = Variant.where(create_hash).first_or_create
    var.issue = Issue.where(title: title).first
    var.save
    puts "-=+=- -=+=- -=+=-"
    puts "VARIANT RECORDED for #{var.issue.title} => #{var.title}"
    puts "-=+=- -=+=- -=+=-"
  end
end
