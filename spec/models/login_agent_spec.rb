require 'spec_helper'

describe LoginAgent do
  before :each do
    @login_agent = build(:login_agent)
  end
  it "Logs in to the Diamond Backend" do
    logged_in = @login_agent.login
    logged_in.class.should eq(Mechanize::Page)
    logged_in.uri.to_s.should eq("https://retailerservices.diamondcomics.com/Home/Index")
  end
  it "Returns a logged in Agent once login occurs" do
    @login_agent.login
    @login_agent.agent.class.should eq(Mechanize)
  end
end
