require 'test_helper'

describe SourceWeaver do

  before do
    @source_weaver = build(:source_weaver)
  end

  #describe "#master_hash" do
    #it "is the same as master_hash" do
    #end
  #end

  #describe "#db_hash" do
    #@source_weaver.db_hash.must_equal DB_HASHER_DIGEST
  #end

  #describe "#fill_in_blurb" do
  #end

  describe "#weave" do
    it "properly weaves the two hashes" do
      @source_weaver.weave.class.must_be Hash
      @source_weaver.weave.wont_be_empty
    end
  end
end
