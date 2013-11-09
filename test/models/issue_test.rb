require 'test_helper'

class IssueTest < ModelTests
  def test_it_has_a_valid_factory
    factory_is_valid? :issue
  end
end
