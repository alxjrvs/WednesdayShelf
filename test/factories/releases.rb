# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :release do
    ship_date {Date.parse "2012-10-19"}
  end
end
