require "test_helper"

class UserTest < ModelTest
  def test_that_it_has_a_valid_factory
    assert_valid_factory :user
  end

  def test_that_a_user_has_a_pull_list
    user = create :user
    assert user.pull_list, "User has no Pull list"
  end
end
