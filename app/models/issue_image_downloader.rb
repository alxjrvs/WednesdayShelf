class IssueImageDownloader

  def initialize(issue, agent)
    @agent = agent
    @issue = issue
    @url = IssueImageUrlDigester.new(@issue.stock_no).digest
  end

  def download_image
    MechanizeClip.get(@url, @agent)
  end

  def download_to_issue
    @issue.cover = self.download_image
    @issue.has_cover = true
    if @issue.save
      puts @issue.title + " has a cover! "
    end
  end

end
