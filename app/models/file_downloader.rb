class FileDownloader

  def initialize(page, url)
    @page = page
    @url = url
  end
  def get_file
    @page.links_with(:href => @url)[0].click

  end

  def file_body
    binding.pry
    get_file.body
  end
end
