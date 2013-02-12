class LoginAgent
  require "net/http"
  require "open-uri"

  attr_reader :agent

  def initialize
    @agent = Mechanize.new
  end

  def backend_home
    @agent.get(ENV['BASE_URL'])
  end

  def login
    page = @agent.get(ENV['LOGIN'])
    form = page.form
    form.UserName =  ENV['USERNAME']
    form.EnteredCustNo =  ENV['CUST_NO']
    form.Password =  ENV['PASSWORD']
    @agent.submit(form)
  end
end
