# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :preview do
    first_diamd_no "AUG00001"
    last_diamd_no "AUG00003"
    digested false
  end
end
