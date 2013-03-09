class PreviewsLogger
  def initialize(db_url, master_url)
    @db = db_url
    @master = master_url
  end

  def get_file(url)
    #Hash[:master => FileDownloader.new(@page, "/FileExport/Misc/MasterDataFile-ITEMS.txt" ).file_body, :db => FileDownloader.new(@page, "/FileExport/MonthlyToolsTXT/previewsDB.txt" ).file_body]
  end

  def digest
    SourceWeaver.new(get_files[:master], get_files[:db]).weave
  end
end
