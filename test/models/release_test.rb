require 'test_helper'

class ReleaseTest < ModelTests

  def setup
    super
    populate_calendar
  end

  def teardown
    super
  end

  def populate_calendar
    release = create :release
    create :release, release_date: release.release_date - 7.days
    create :release, release_date: release.release_date + (7 * 1).days
    create :release, release_date: release.release_date + (7 * 2).days
    create :release, release_date: release.release_date + (7 * 3).days
    create :release, release_date: release.release_date + (7 * 4).days
    create :release, release_date: release.release_date + (7 * 5).days
  end

  def test_valid_factory
    assert_equal true, Release.first.valid?
  end

  def test_release_gives_correct_current
  end
end
