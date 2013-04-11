class IssueUpdater

  attr_reader :issue, :agent
  def initialize(issue, agent)
    @agent = agent
    @issue = issue
  end

  def cancel_check
    @_cancel_check ||= IssueCancelChecker.new(popup_hasher.get_html, issue)
  end

  def popup_hasher
    @_popup_hasher ||= PopupHasher.new(issue.diamond_no, agent)
  end

  def release_date
    @_release_date ||= DateFormatter.new(popup_hasher.to_hash["Est Ship Date"]).format_date
  end

  def updated_release
    @_updated_release ||= Release.where(ship_date: release_date).first_or_create
  end

  def cancelled?
    return true if cancel_check.check_for_not_found
    return true if cancel_check.check_for_cancelled
    return false
  end

  def is_updated?
    if issue.release == updated_release
      puts "#{issue.title} Has no Update"
      return false
    else
      return true
    end
  end


  def update
    return false if cancelled?
    if is_updated?
      issue.release = updated_release
      issue.save
      puts "Updated Shipping for #{issue.title}"
      return true
    else
      return false
    end
  end

end
