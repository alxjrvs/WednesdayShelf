require 'spec_helper'
require_relative '../support/master_hasher/expectations.rb'

describe MasterHasher do
  before :each do 
    @master_hasher = build(:master_hasher)
  end
  it "should split the file on rows and new lines" do
    @master_hasher.split_file.size.should eq(6)
    @master_hasher.split_file.should eq(MH_SPLIT_EXPECTED)
  end
  it "should return the right keys" do
    @master_hasher.get_keys.should eq(MH_KEYS_EXPECTED)
  end
  it "should produce the correctly digested hash" do
    @master_hasher.digest.should_not eq([])
    @master_hasher.digest.should eq(MH_DIGEST_EXPECTED)
  end
 end
