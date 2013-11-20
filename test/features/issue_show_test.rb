require 'test_helper'

class IssueShowTest < FeatureTest

  def setup
    super
    setup_ideal_issue
  end

  def test_basic_content
    visit issue_path(@issue)
    assert page.has_title? "#{@issue.clean_title} - WednesdayShelf"
  end

  def test_issue_content
    visit issue_path(@issue)
    assert_content @issue.clean_title
    assert_content @issue.issue_number
    assert_content @issue.description
    assert_link "Pull It"
  end

  private

  def setup_ideal_issue
    @issue= create :issue
    @hero_cover =  create :cover, issue: @issue, diamond_number: @issue.diamond_number
    3.times do |i|
      create :cover, issue: @issue, diamond_number: "AUG1234#{i}"
    end
  end
end
