require 'test_helper'

describe LoginAgent do
  before  do
    VCR.insert_cassette(__name__)
    @agent = build(:login_agent)
  end

  after do
    VCR.eject_cassette
  end
  it "logs in to the diamond backend" do
    logged_in = @agent.login
    logged_in.page.title.must_equal "DCD Retailer Services - Home"
  end
end
