require 'test_helper'

class IssueTest < ModelTests
  def test_it_has_a_valid_factory
    assert_valid_factory :issue
  end
end
