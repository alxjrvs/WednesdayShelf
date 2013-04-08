class IssueUpdater

  attr_reader :issue, :agent
  def initialize(issue, agent)
    @agent = agent
    @issue = issue
  end

  def cancel_check
    @_cancel_check ||= IssueCancelChecker.new(popup_hasher.get_html, self)
  end

  def popup_hasher
    @_popup_hasher ||= PopupHasher.new(self.diamond_no, agent)
  end

  def release_date
    @_release_date ||= DateFormatter.new(popup_hasher.to_hash["Est Ship Date"]).format_date
  end

  def updated_release
    @_updated_release ||= Release.where(ship_date: release_date).first_or_create
  end

  def update
    return nil if cancel_check(agent).check_for_not_found
    return nil if cancel_check(agent).check_for_cancelled
    return false if issue.release == update_release
    issue.update_attributes(release_id: updated_release.id)
    puts "Updated Shipping for #{self.title}"
    return true
  end

end
