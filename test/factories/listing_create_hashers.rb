# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :listing_create_hasher do
    ignore do
      listing {build(:issue_listing)}
    end
    initialize_with {new(listing)}
  end
end
