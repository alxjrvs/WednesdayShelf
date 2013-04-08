require 'test_helper'

describe VariantRecorder do

  before do
    @issue_recorder = build(:issue_recorder)
    @variant_recorder = build(:variant_recorder)
  end

  describe "#record" do
    it "should record the correct variant" do
      issue = @issue_recorder.record
      variant = @variant_recorder.record
      variant.issue.must_equal issue
    end
  end

end
