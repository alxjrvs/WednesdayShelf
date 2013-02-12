require 'spec_helper'
require_relative '../support/db_hasher/expectations.rb'

describe DbHasher do
  before :each do
    @db_hasher = build(:db_hasher)
  end
  it "creates a hash of Diamond Numbers and blurbs" do
    @db_hasher.digest.should eq(DB_DIGEST_EXPECTED)
  end
end
