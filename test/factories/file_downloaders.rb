FactoryGirl.define do
  factory :file_downloader do
    ignore do
      agent {build(:login_agent).login}
      url  "/Downloads/Archives/monthlytools/previews_product_copy/previewsDB_201208.TXT"
    end

    factory :db_file_downloader, class: FileDownloader do
      ignore do
        url  "/Downloads/Archives/monthlytools/previews_product_copy/previewsDB_201208.TXT"
      end
    end

    factory :master_file_downloader, class: FileDownloader do
      ignore do
        url "/Downloads/Archives/monthlytools/previews_master_data_file/MasterDataFile-ITEMS_201212.txt"
      end
    end
    initialize_with {new(url, agent)}
  end
end
