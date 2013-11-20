require 'test_helper'

class IssueTest < ModelTest

  def setup
    super
    @release = create :release
    @issue = create :issue, release: @release
    @cover = create :cover, issue: @issue
  end
end
