require 'test_helper'

class IssueShowTest < FeatureTest
  include LateralNavigation

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

  def test_lateral_navigation
    previous_issue = create :issue, :previous, series: @issue.series
    next_issue = create :issue, :next, series: @issue.series
    assert_previous_nav(start_path: issue_path(@issue), target_path: issue_path(previous_issue))
    assert_next_nav(start_path: issue_path(@issue), target_path: issue_path(next_issue))
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
