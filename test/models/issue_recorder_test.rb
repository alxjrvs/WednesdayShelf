require 'test_helper'

describe IssueRecorder do

  before do
    @issue_recorder = build(:issue_recorder)
  end

  describe "#record" do
    it "must create a proper issue" do
      issue = @issue_recorder.record
      issue.series.must_equal @issue_recorder.series
      issue.series.publisher.must_equal @issue_recorder.publisher
    end
  end

end
