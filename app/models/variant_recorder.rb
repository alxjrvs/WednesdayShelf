class VariantRecorder

  def initialize(listing)
    @listing = listing
  end

  def record
    var = Variant.where(ListingCreateHasher.new(listing).digest).first_or_create
    var.issue = Issue.where(:title => @name)[0]
    var.save
    puts "-=+=- -=+=- -=+=-"
    puts "VARIANT RECORDED for #{var.issue.title} => #{var.title}"
    puts "-=+=- -=+=- -=+=-"
  end
end
