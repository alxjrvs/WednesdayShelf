IssueFacade = Struct.new(:issue, :user) do
  delegate :id, :clean_title, :series, :covers, :hero_cover, :diamond_number, :release, to: :issue

  def real
    return issue
  end

  def subscribed?
    user.subscribed_to? issue
  end

  def subscribed_class
    return nil unless user
    if subscribed? 
      "subscribed"
    else
      nil
    end
  end

  def pull_it_text
    return "Pull It" if user.nil?
    if user.pull_list.series.include? issue.series
      "Remove from List"
    else
      "Pull It"
    end
  end

  def next_issue
    @_next_issue ||= issue.next
  end

  def previous_issue
    @_previous_issue ||= issue.previous
  end

end
