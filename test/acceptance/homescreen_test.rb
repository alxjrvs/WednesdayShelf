require 'test_helper'

class HomescreenTest < AcceptanceTests

  def setup
    super
    @release = create :release
  end

  def test_basic_content
    visit '/'
    assert page.has_title? "WednesdayShelf"
    assert_content @release.pretty_release_date
  end
end
