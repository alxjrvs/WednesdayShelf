class IssueFacade
  attr_reader :issue, :user

  def initialize(issue, user)
    @issue = issue
    @user = user
  end

  def next_issue
    @_next_issue ||= issue.next
  end

  def previous_issue
    @_previous_issue ||= issue.previous
  end

end
