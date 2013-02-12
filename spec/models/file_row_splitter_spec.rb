require 'spec_helper'
require_relative '../support/master_hasher/expectations.rb'

describe FileRowSplitter do
  before :each do
    @split_file = build(:file_row_splitter)
  end
  it "should split the file on rows and new lines" do
    @split_file.file.size.should eq(6)
    @split_file.file.should eq(MH_SPLIT_EXPECTED)
  end
end
