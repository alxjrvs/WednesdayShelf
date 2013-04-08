require 'test_helper'

describe IssueRecorder do

  before do
    @issue_recorder = build(:issue_recorder)
  end

  describe "#record" do
    it "must create a proper issue" do
      Issue.all.count.must_equal 0
      issue = @issue_recorder.record
      Issue.all.count.must_equal 1
      issue.series.must_equal @issue_recorder.series
      issue.series.publisher.must_equal @issue_recorder.publisher
    end
  end

end
