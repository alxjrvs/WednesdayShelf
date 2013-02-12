require_relative '../support/db_hasher/raw.rb'
require_relative '../support/master_hasher/raw.rb'
FactoryGirl.define do
  factory :source_weaver do
    ignore do
      master MH_RAW
      db DB_RAW
    end
    initialize_with {SourceWeaver.new(master, db)}
  end
end
