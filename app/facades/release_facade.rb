ReleaseFacade = Struct.new(:release, :user) do

  def current
    @_current ||= release
  end

  def next
    @_next ||= current.next
  end

  def pretty_date
    @_pretty_date ||= current.date.stamp "August 31st, 1988"
  end

  def previous
    @_previous ||= current.previous
  end

  def subscribed_issues
    @_subscribed_issues ||= begin
      return [] unless user
      series_ids = user.pull_list.series.map(&:id)
      current.issues.where(series_id: series_ids).map {|issue| IssueFacade.new(issue, user)}
    end
  end

  def unsubscribed_issues
    @_unsubscribed_issues ||= begin
    return issues unless user
    series_ids = user.pull_list.series.map(&:id)
    return issues if series_ids.empty?
    current.issues.where("series_id NOT in (?)", series_ids).map {|issue| IssueFacade.new(issue, user)}
    end
  end

  def issues
    @_issues ||= begin
      release.issues.map do |issue|
        IssueFacade.new(issue, user)
      end
    end
  end
end
