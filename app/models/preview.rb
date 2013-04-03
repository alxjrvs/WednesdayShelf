class Preview < ActiveRecord::Base
  has_many :listings

  def digest
    return false if self.digested == true
    self.listings.each do |listing|
      ListingDigester.new(listing).digest
    end
    pp "Previews Digested"
    self.update_attributes(digested: true)
    return true
  end
end
