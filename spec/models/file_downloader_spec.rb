require 'spec_helper'

describe FileDownloader do
  before :each do
    @file_downloader = build(:file_downloader)
  end
   it "downloads a proper file" do
    @file_downloader.get_file.should_not eq(nil)
    @file_downloader.get_file.class.should eq(Mechanize::File)
   end
  it "returns the body of that file" do
    @file_downloader.file_body.should_not eq(nil)
    @file_downloader.file_body.class.should eq(String)
  end
end
