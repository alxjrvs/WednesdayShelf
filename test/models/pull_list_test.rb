require 'test_helper'

class PullListTest < ModelTest
  def test_that_it_has_a_valid_factory
    assert_valid_factory :pull_list
  end

  def test_that_it_can_contain_series
    populate
    assert_includes @pull_list.series, @series
  end

  def test_that_it_can_show_issues_by_a_given_release
    populate
    @pull_list.issues_by_release(@release).each do |issue|
      assert_equal @release, issue.release
    end
  end

  def test_that_it_can_collate_prices_per_release
    populate
    assert_equal 8.97, @pull_list.total_price_per_release(@release)
  end


  def populate
    @series = create :series
    @release = create :release
    3.times do |i|
      create :issue, issue_number: i + 1, series: @series, release: @release, price: 2.99
    end
    @pull_list = create :pull_list
    @pull_list.series << @series
  end
end
