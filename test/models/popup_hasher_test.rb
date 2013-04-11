require 'test_helper'

describe PopupHasher do
  before do
    @popup_hasher = build(:popup_hasher)
  end

  describe "#get_url" do
    #it "creates the right url" do
      #@popup_hasher.get_url.must_equal(BASE_URL + FANCYBOX_URL + "OCT120201").gsub("\n", '')
    #end
  end

  describe "#to_hash" do
    it "creates a hash" do
      @popup_hasher.to_hash.must_be_kind_of Hash
    end
  end

end
