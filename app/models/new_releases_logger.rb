class NewReleasesLogger
  def initialize
    @page = LoginAgent.new.login.links_with(:text => "Data Files")[0].click
  end

  def get_files
    Hash[:master => FileDownloader.new(@page, "/FileExport/Misc/MasterDataFile-ITEMS.txt" ).file_body, :db => FileDownloader.new(@page, "/FileExport/MonthlyToolsTXT/previewsDB.txt" ).file_body]
  end

  def digest
    SourceWeaver.new(get_files[:master], get_files[:db]).digest
  end
end
