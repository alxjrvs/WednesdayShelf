require 'test_helper'

describe SourceWeaver do

  before do
    @source_weaver = build(:source_weaver)
  end

  describe "#master_hash" do
    it "is the same as master_hash" do
      @source_weaver.master_hash.must_equal MASTER_TO_HASHER_DIGEST
    end
  end

  describe "#db_hash" do
    it "matches expectations" do
      @source_weaver.db_hash.must_equal DB_TO_HASHER_DIGEST
    end
  end

  describe "#fill_in_blurb" do
  end

  describe "#weave" do
    it "properly weaves the two hashes" do
      weaved = @source_weaver.weave
      weaved.class.must_equal Array
      weaved.wont_be_empty
      weaved.must_equal SOURCE_WEAVER_WEAVE
    end
  end
end
