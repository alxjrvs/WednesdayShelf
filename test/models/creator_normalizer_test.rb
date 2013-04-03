require 'test_helper'

describe CreatorNormalizer do

  before do
    @single = build(:single_creator)
    @multiple = build(:multiple_creators)
  end

  describe "#format" do
    it "correctly formats single creators" do
      @single.format.must_equal "Grant Morrison"
    end

    it "correctly formats multiple creators" do
      @multiple.format.must_equal "Grant Morrsion , Jack Kirby"
    end
  end
end
