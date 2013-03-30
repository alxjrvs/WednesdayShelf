require "test_helper"

describe PreviewsRecorder do

  before do
    @previews_recorder = build(:previews_recorder)
  end

  describe "#new_preview" do
    it "creates a single preview" do
      @previews_recorder.preview
      Preview.all.count.must_equal 1
    end
  end

  describe "#sanitize_string" do
    #todo
  end

  describe "#rebrand_hashes" do
    it "creates an array" do
      @previews_recorder.rebrand_hashes.class.must_equal Array
    end

    it "should match expectation" do
      #@previews_recorder.rebrand_hashes.must_be PREVIEWS_RECORDER_REBRAND_HASH
    end
  end

  describe "#record" do
    it "records the correct number of listings" do
      hashes_num = @previews_recorder.rebrand_hashes.size
      Listing.all.size.must_equal 0
      @previews_recorder.record
      Listing.all.size.must_equal hashes_num
    end
  end
end
