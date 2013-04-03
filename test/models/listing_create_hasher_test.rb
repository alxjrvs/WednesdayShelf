require 'test_helper'

describe ListingCreateHasher do

  before do
    @hasher = build(:listing_create_hasher)
  end

  describe "#digest" do
    it "should properly parse the listing" do
      digest = @hasher.digest

      digest.class.must_equal Hash
      digest[:title].must_equal "FANTASTIC FOUR #4"
      digest[:description].must_equal "The Fantastic four do a thing! "
      digest[:diamond_no].must_equal "DEC120650"
      digest[:stock_no].must_equal "STK522777"
      digest[:writer].must_equal "Matt Fraction"
      digest[:artist].must_equal "Mark Bagley"
      digest[:cover_artist].must_equal "Mark Bagley"
      digest[:issue_no].must_equal 4
      digest[:max_issue].must_equal 0
      digest[:price].must_equal 2.99
    end
  end
end
