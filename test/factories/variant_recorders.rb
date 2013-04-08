# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :variant_recorder do
    ignore do
      listing {build(:variant_listing)}
    end
    initialize_with {new(listing)}
  end
end
