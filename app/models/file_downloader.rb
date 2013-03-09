class FileDownloader

  attr_reader :url

  def initialize(url, agent = MASTER_AGENT)
    @url = url
    @agent = agent
  end

  def get_source_file
    @agent.get(BASE_URL + url)
  end

  def file_body
    @file_body ||= get_source_file.body
  end
end
