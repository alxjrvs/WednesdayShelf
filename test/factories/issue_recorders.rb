# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue_recorder do
    ignore do
      listing {build(:issue_listing)}
    end
    initialize_with {new(listing)}
  end
end
