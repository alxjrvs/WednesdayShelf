FactoryGirl.define do
  factory :file_downloader  do
      ignore do
        page { build(:login_agent).login.links_with(:text => "Data Files")[0].click }
        url "/FileExport/Misc/MasterDataFile-ITEMS.txt"
      end
    initialize_with {FileDownloader.new(page, url)}
  end
end
