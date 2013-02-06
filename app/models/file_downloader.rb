class FileDownloader

  def initialize(page, url)
    @page = page
    @url = url
  end

  def download
    @page.links_with(:href => @url)[0].click.body
  end
end
