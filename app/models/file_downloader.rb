class FileDownloader

  attr_reader :url

  def initialize(url, agent)
    @url = url
    @agent = agent
  end

  def get_source_file
    puts BASE_URL + url
    @agent.get(BASE_URL + url)
  end

  def file_body
    @file_body ||= get_source_file.body
  end
end
