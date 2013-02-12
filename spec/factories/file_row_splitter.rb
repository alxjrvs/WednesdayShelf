require_relative '../support/master_hasher/raw.rb'

FactoryGirl.define do
  factory :file_row_splitter do
    ignore do
      file MH_RAW
    end
    initialize_with {FileRowSplitter.new(file)}
  end
end
