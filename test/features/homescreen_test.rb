require 'test_helper'

class HomescreenTest < FeatureTest

  def setup
    super
    @release = create :release
  end

  def test_basic_content
    visit root_path
    assert page.has_title? "WednesdayShelf"
    assert_content @release.pretty_date
  end

  def test_issue_content
    visit '/'
  end
end
