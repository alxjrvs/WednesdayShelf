require 'test_helper'

describe IssueUpdater do

  describe "Setter Methods" do

    before do
      @issue_updater = build(:issue_updater)
    end

    describe "#cancel_check" do
      it "should be an instance of IssueCancelChecker" do
        @issue_updater.cancel_check.must_be_kind_of IssueCancelChecker
      end
    end

    describe "#popup_hasher" do
      it "should be an instance of PopupHasher" do
        @issue_updater.popup_hasher.must_be_kind_of PopupHasher
      end
    end

    describe "#updated_release" do
      it "should be a release" do
        @issue_updater.updated_release.must_be_kind_of Release
      end
    end
  end

  describe "Normal Issue" do

    before do
      @issue_updater = build(:issue_updater)
    end

    describe "#release_date" do
      it "should be a Date object" do
        @issue_updater.release_date.must_be_kind_of DateTime
      end

      it "should parse the correct date" do
        @issue_updater.release_date.to_s.must_equal "2012-12-19T00:00:00+00:00"
      end
    end

    it "should update books with a new release date" do
      release = @issue_updater.issue.release
      @issue_updater.update.must_equal true
      Issue.find(@issue_updater.issue.id).release.wont_equal release
    end
  end

  describe "cancelled Issue" do

    before do
      @issue_updater = build(:cancelled_issue_updater)
    end

    it "should correctly recognize non-updated books" do
      @issue_updater.update.must_equal false
    end
  end
end
