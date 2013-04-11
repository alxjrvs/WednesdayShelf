require 'test_helper'

describe IssueCancelChecker do

  describe "Non-Cancelled Book" do
    before do
      @checker = build(:issue_cancel_checker)
    end

    it "ignores non-cancelled books" do
      @checker.check_for_cancelled.must_equal false
      @checker.check_for_not_found.must_equal false
    end
  end

  describe "cancelled book" do
    before do
      @checker = build(:cancelled_issue_cancel_checker)
    end

    describe "check_for_cancelled" do
      it "finds and cancels a cancelled issue"do
        @checker.check_for_cancelled.must_equal true
        Issue.where(id: @checker.issue.id).must_be_empty
      end
    end
  end

end
