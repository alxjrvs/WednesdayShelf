require 'test_helper'

describe Preview do


  describe "undigested" do
    before do
      @preview = FactoryGirl.build(:preview)
    end

    describe "#digest" do
      it "should return true" do
        @preview.digest.must_equal true
      end
    end
  end

  describe "digested" do
    before do
      @preview = FactoryGirl.build(:digested_preview)
    end

    describe "#digest" do
      it "should return false" do
        @preview.digest.must_equal false
      end
    end
  end
end

