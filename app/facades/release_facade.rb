ReleaseFacade = Struct.new(:release, :user) do
  def current
    release
  end

  def next
    release.next
  end

  def pretty_date
    current.date.stamp "August 31st, 1988"
  end

  def previous
    release.previous
  end

  def subscribed_issues
    return [] unless user
    series_ids = user.pull_list.series.map(&:id)
    release.issues.where(series_id: series_ids).map {|issue| IssueFacade.new(issue, user)}
  end

  def unsubscribed_issues
    return issues unless user
    series_ids = user.pull_list.series.map(&:id)
    return issues if series_ids.empty?
    release.issues.where("series_id NOT in (?)", series_ids).map {|issue| IssueFacade.new(issue, user)}
  end

  def issues
    release.issues.map do |issue|
      IssueFacade.new(issue, user)
    end
  end
end
