require 'test_helper'

describe TitleStripper do

  before do
    @title_stripper = build(:title_stripper)
  end

  describe "#strip" do
    it "should return snipped string" do
      @title_stripper.strip.must_equal "FANTASTIC FOUR #15"
    end
  end
end
