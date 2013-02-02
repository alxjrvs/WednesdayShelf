class IssueImageDownloader

  def initialize(issue, agent)
    @agent = agent
    @issue = issue
    @url = IssueImageUrlDigester.new(@issue).digest
  end

  def download_image
    MechanizeClip.get(@url, @agent)
  end

  def save_to_issue
    @issue.cover = self.download_image
    @issue.save
  end

end
