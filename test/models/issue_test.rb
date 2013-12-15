require 'test_helper'

class IssueTest < ModelTest

  def setup
    super
    @release = create :release
    @series = create :series
    @issue = create :issue, release: @release, series: @series, raw_title: "PUG LOVER #14"
  end

  def test_validations
    assert_homing_string_uniqueness
    assert_diamond_number_uniqueness
  end

  def test_that_an_issue_can_have_covers
    assert_empty @issue.covers
    create :cover, issue: @issue
    assert_equal @issue.covers.size, 1
  end

  def test_that_an_issue_knows_what_issues_come_after_it_in_a_series
    next_issue = create :issue, series: @series, release: @release, homing_string: "NEW ISSUE", diamond_number: "NEXT WEEK", raw_title: "PUG LOVER #15"

    future_issue = create :issue, series: @series, release: @release, homing_string: "FUTURE ISSUE", diamond_number: "FUTURE WEEK", raw_title: "PUG LOVER #16"

    assert_equal @issue.future, [next_issue, future_issue]
    assert_equal @issue.next, next_issue
  end

  def test_that_an_issue_knows_what_issues_preceed_it_in_its_series
    last_issue = create :issue, series: @series, release: @release, homing_string: "OLD ISSUE", diamond_number: "LAST WEEK", raw_title: "PUG LOVER #13"
    ancient_issue = create :issue, series: @series, release: @release, homing_string: "ANCIENT ISSUE", diamond_number: "ANCIENT WEEK", raw_title: "PUG LOVER #12"

    assert_equal @issue.past, [last_issue, ancient_issue]
    assert_equal @issue.previous, last_issue
  end

  def test_that_it_recognizes_a_hero_cover
    @hero = create :cover, issue: @issue
    5.times do |i|
      create :cover, diamond_number: i, issue: @issue
    end
    assert_equal @issue.hero_cover, @hero
  end

  def test_that_first_cover_is_hero_cover_when_there_is_no_hero_cover
    cover = create :cover, diamond_number: "NOT THE HERO", issue: @issue
    assert_equal @issue.hero_cover, cover
  end

  def test_that_default_cover_is_hero_cover_when_there_are_no_covers
    assert_equal @issue.hero_cover, Cover.default_hero
  end

  private

  def assert_homing_string_uniqueness
    false_issue = build :issue, homing_string: @issue.homing_string, release: @release
    refute_valid false_issue
  end

  def assert_diamond_number_uniqueness
    false_issue = build :issue, diamond_number: @issue.diamond_number, release: @release
    refute_valid false_issue
  end
end
