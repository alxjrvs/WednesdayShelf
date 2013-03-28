FactoryGirl.define do
  factory :file_downloader do
    ignore do
      url "/Downloads/Archives/monthlytools/previews_master_data_file/MasterDataFile-ITEMS_201212.txt"
      agent build(:login_agent)
    end
  initialize_with {new(url, agent.login)}
  end
end
