require 'test_helper'

class ReleaseTest < ModelTest

  def test_that_it_has_a_valid_factory
    assert_valid_factory :release
  end

  def test_future_scope
    populate_releases
    past_release = Release.where(date: canonical_date - 7.days)
    futures = Release.future
    refute_includes futures, past_release
  end

  def test_current_is_never_nil
    @old_release = create :release, date: Date.current - 5.months
    assert_equal Release.current, @old_release

    @modern_release = create :release, date: Date.current
    assert_equal Release.current, @modern_release
  end

  def test_next_and_previous_releases
    populate_releases
    next_release_in_order_and_correct?
    previous_release_in_order_and_correct?
  end

  def test_today_is_current?
    release = create :release, date: canonical_date
    assert_equal Release.current, release
  end

  def test_pretty_date
    release = create :release, date: Date.new(2013, 10, 31)
    assert_equal release.pretty_date, "Thursday, October 31st"
  end

  private

  def canonical_date
    Date.current
  end

  def populate_releases
    @current_release = create :release, date: canonical_date
    @past_release = create :release, date: canonical_date - 7.days
    @next_release = create :release, date: canonical_date + (7 * 1).days
  end

  def next_release_in_order_and_correct?
    assert_equal @current_release.next, @next_release
  end

  def previous_release_in_order_and_correct?
    assert_equal @current_release.previous, @past_release
  end
end
