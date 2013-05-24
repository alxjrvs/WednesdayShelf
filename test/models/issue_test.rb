require 'test_helper'

describe Issue do
  it "has a valid category" do
    issue = create :issue
    issue.must_be :valid?
  end
end
