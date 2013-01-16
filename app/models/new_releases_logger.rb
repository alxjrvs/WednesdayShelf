class NewReleasesLogger
  def initialize
    @page = LoginAgent.new.login.page.links_with(:text => "Data Files")[0].click
    @url = ["/FileExport/Misc/MasterDataFile-ITEMS.txt","/FileExport/MonthlyToolsTXT/previewsDB.txt"]
    @master_link = @page.links_with(:href => @url[0])[0].click.body
    @db_link = @page.links_with(:href => @url[1])[0].click.body
    @total_hash = {}
  end

  def digest
    @total_hash.merge! SourceWeaver.new(@master_link, @db_link).digest
  end
end
