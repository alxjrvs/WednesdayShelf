# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :file_to_hasher do
    ignore do
      file {build(:master_file_downloader).file_body}
      filetype :master
    end

    factory :master_to_hasher, class: FileToHasher do
      ignore do
        file {build(:master_file_downloader).file_body}
        filetype :master
      end
    end

    factory :db_to_hasher, class: FileToHasher do
      ignore do
        file {build(:db_file_downloader).file_body}
        filetype :db
      end
    end
    initialize_with {new(file, filetype)}
  end
end
