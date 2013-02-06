require_relative '../support/db_hasher/raw.rb'
FactoryGirl.define do
  factory :db_hasher do
    ignore do
      db DB_RAW
    end
    initialize_with {DbHasher.new(db)}
  end
end
