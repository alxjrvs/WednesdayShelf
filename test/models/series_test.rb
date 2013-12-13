require 'test_helper'

class SeriesTest < ModelTest

  def assemble_series
    @series = create :series
    3.times do |i|
      issue = create :issue, homing_string: i, diamond_number: i, issue_number: (i +1), release: (create :release, release_date: Date.current + (7 * i + 1).days)
      @series.issues << issue
    end
  end

  def test_that_it_has_a_valid_factory
    assert_valid_factory :series
  end

  def test_that_a_series_can_contain_issues
    assemble_series
    assert_equal 3, @series.issues.size
    assert_equal 1, @series.issues.first.issue_number
  end

  def test_that_it_recognizes_upcoming_releases
    assemble_series
  end
end
