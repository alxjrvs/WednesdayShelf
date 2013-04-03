class Preview < ActiveRecord::Base
  has_many :listings

  def digest
    return true if self.digested == true
    self.listings.each do |listing|
      ListingDigester.new(listing).digest
    end
    pp "Previews Digested"
    previews.digested = true
    previews.save
  end
end
