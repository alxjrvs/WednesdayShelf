# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :preview do
    first_diamd_no "AUG0001"
    last_diamd_no "AUG9999"
    digested false
  end
end
