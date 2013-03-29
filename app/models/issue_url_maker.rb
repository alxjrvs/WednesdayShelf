class IssueUrlMaker

  def initialize(diamd_no)
    @diamd_no = diamd_no
  end

  def get_url
    "#{BASE_URL + FANCYBOX_URL}#{@diamd_no}".gsub("\n", "")
  end
end
