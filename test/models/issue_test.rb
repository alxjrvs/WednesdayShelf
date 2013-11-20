require 'test_helper'

class IssueTest < ModelTest

  def setup
    super
    @release = create :release
    @issue = create :issue, release: @release
  end

  def test_that_an_issue_can_have_covers
    assert_empty @issue.covers
    create :cover, issue: @issue
    assert_equal @issue.covers.size, 1
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

  def test_validations
    assert_homing_string_uniqueness
    assert_diamond_number_uniqueness
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
