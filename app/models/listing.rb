class Listing < ActiveRecord::Base
  belongs_to :preview

  def is_comic?
    ListingFilter.new(self).is_comic?
  end
end
