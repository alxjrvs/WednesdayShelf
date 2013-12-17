require 'test_helper'

class HomescreenTest < FeatureTest
  include LateralNavigation

  def setup
    super
    @release = ReleaseFacade.new((create :release, :current), nil)
    create :release, :next
    create :release, :previous

  end

  def test_basic_content
    visit root_path
    assert page.has_title? "WednesdayShelf"
    assert_content @release.pretty_date
  end

  def test_lateral_nagivation
    assert_previous_nav(start_path: root_path, target_path: release_path(@release.previous))
    assert_next_nav(start_path:root_path, target_path: release_path(@release.next))
  end

  def test_issue_content
    visit root_path
  end

end
