require 'test_helper'

describe IssueUpdater do

  describe "#popup_url" do
    it "should produce a hash of the popup elements" do
      #testing popup hasher
    end
  end

  describe "#cancel_check" do
    it "should correctly diagnost a cancelled book" do
      #testing CancelChecker
    end
  end

  describe "#update" do
    it "should not update 'not_found' issues"
    it "should not update cancelled books"
    it "should correctly recognize non-updated books"
    it "should update the release to the correct release" do

    end
  end
end
