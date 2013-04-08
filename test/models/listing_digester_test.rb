require 'test_helper'

describe ListingDigester do

  describe "Non-comic listings" do

    before do
      @listing = build(:non_comic_listing_digester)
    end

    describe "#digest" do
      it "returns false" do
        @listing.digest.must_equal false
      end
    end
  end

  describe "comic listings" do

    describe "#digest" do
      before do
        Issue.destroy_all
      end
      it "should properly digest both issue and variant" do
        issue = build(:issue_listing_digester).digest
        variant = build(:variant_listing_digester).digest
        issue.variants.count.must_equal 1
        issue.variants.first.must_equal variant
      end
    end
  end
end
