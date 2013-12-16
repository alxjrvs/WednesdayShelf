module IssueHelper
  def series_range(series)
    issues = series.issues
    if issues.count == 1
      "#{issues.first.release.date.year} (1 Issue)"
    else
      first = issues.first.release.date.year
      last = issues.last.release.date.year
      "#{first} - #{last} (#{issues.count} Issues)"
    end
  end

end
