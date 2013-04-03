FactoryGirl.define do
  factory :listing_digester do
    factory :non_comic_listing_digester, class: ListingDigester do
      ignore do
        listing {build(:non_comic_listing)}
      end
      initialize_with {new(listing)}
    end
    factory :issue_listing_digester, class: ListingDigester do
      ignore do
        listing {build(:issue_listing)}
      end
      initialize_with {new(listing)}
    end
    factory :variant_listing_digester, class: ListingDigester do
      ignore do
        listing {build(:variant_listing)}
      end
      initialize_with {new(listing)}
    end
  end
end
