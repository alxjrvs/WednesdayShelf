FactoryGirl.define do
  factory :source_weaver do
    ignore do
      master {build(:master_file_downloader).file_body}
      db {build(:db_file_downloader).file_body}
    end
    initialize_with {new(master, db)}
  end
end
