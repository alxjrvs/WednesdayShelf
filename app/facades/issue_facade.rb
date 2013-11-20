class IssueFacade
  attr_reader :issue, :user

  def initialize(issue, user)
    @issue = issue
    @user = user
  end

end
