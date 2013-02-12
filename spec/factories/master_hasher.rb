require_relative '../support/master_hasher/raw.rb'
FactoryGirl.define do
  factory :master_hasher do
    ignore do
      master MH_RAW
    end
    initialize_with {MasterHasher.new(master)}
  end
end
