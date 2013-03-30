require 'test_helper'

describe FileToHasher do

  describe "generic tests" do
    before do
      @hasher = build(:file_to_hasher)
    end

    describe "#rows" do
      it "splits the file into rows" do
        should_be_an_array @hasher.rows
      end
    end

    describe "#keys" do
      it "produces a list of keys" do
        should_be_an_array @hasher.keys
      end
    end
  end

  describe "db hasher" do
    before do
      @hasher = build(:db_to_hasher)
    end

    describe "#digest" do
      it "Should digest into a hash" do
        hasher_digest = @hasher.digest
        should_be_a_hash hasher_digest
      end

      it "should match expectations" do
        @hasher.digest.must_equal DB_TO_HASHER_DIGEST
      end

    end
  end

  describe "master hasher" do
    before do
      @hasher = build(:master_to_hasher)
    end
    describe "#digest" do
      it "Should digest into an array" do
        hasher_digest = @hasher.digest
        should_be_an_array hasher_digest
      end

      it "should match expectations" do
        @hasher.digest.must_equal MASTER_TO_HASHER_DIGEST
      end
    end
  end

  def should_be_a_hash(input)
    input.class.must_equal Hash
    input.wont_be_empty
  end

  def should_be_an_array(input)
    input.class.must_equal Array
    input.wont_be_empty
  end
end
