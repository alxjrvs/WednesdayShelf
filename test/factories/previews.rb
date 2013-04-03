FactoryGirl.define do
  factory :preview do
    first_diamd_no "AUG0001"
    last_diamd_no "AUG9999"
    digested false

    factory :digested_preview do
      digested true
    end
  end
end
