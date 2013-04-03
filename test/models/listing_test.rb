require 'test_helper'

describe Listing do
  describe "Non-comic listing" do
    before do
      @listing = FactoryGirl.build(:non_comic_listing)
    end

    describe "#is_comic?" do
      it "should be false" do
        @listing.is_comic?.must_equal false
      end
    end
  end
  describe "Comic Listing" do
    before do
      @listing = FactoryGirl.build(:issue_listing)
    end
    describe "#is_comic?" do
      it "should be true" do
        @listing.is_comic?.must_equal true
      end
    end
  end
end
