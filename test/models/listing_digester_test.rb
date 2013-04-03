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

    before do
      @comic_listing = build(:issue_listing_digester)
      @variant_listing = build(:variant_listing_digester)
    end

    describe "#digest" do
      it "should properly digest both issue and variant" do
        @comic_listing.digest
        @variant_listing.digest
        Issue.all.count.must_equal 1
        Variant.all.count.must_equal 1
        Issue.first.variants.count.must_equal 1
        Issue.first.variants.first.must_equal Variant.first
      end
    end
  end
end
