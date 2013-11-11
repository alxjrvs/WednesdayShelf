require 'test_helper'

class UserTest < ModelTest
  def test_that_it_has_a_valid_factory
    assert_valid_factory :user
  end

  def test_that_a_user_can_add_series_to_their_pull_list
    user = create :user
    series = create :series
  end
end
