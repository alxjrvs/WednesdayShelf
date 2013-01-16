class LoginAgent
  require "net/http"
  require "open-uri"

  attr_reader :agent

  def initialize
    @agent = Mechanize.new
  end

  def login
    page = @agent.get(ENV['LOGIN'])
    form = page.form
    form.UserName =  ENV['USERNAME']
    form.EnteredCustNo =  ENV['CUST_NO']
    form.Password =  ENV['PASSWORD']
    @agent = @agent.submit(form)
    #page = @agent.page.links_with(:text => "Data Files")[0].click
  end
end
