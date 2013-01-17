class IssueUrlMaker

  def initialize(diamd_no)
    @diamd_no = diamd_no
  end

  def get_url
    "#{ENV['BASE_URL']}#{ENV['FANCBOX_URL']}#{@diamd_no}".gsub("\n", "")
  end
end
