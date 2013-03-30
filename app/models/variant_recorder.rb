class VariantRecorder

  attr_reader :listing, :name
  def initialize(listing, name)
    @listing = listing
    @name = name
  end
  
  def create_hash
    @_create_hash = ListingCreateHasher.new(listing).digest
  end

  def record
    var = Variant.where(create_hash).first_or_create
    var.issue = Issue.where(title: name).first
    var.save
    puts "-=+=- -=+=- -=+=-"
    puts "VARIANT RECORDED for #{var.issue.title} => #{var.title}"
    puts "-=+=- -=+=- -=+=-"
  end
end
