class HomePageFacade

  def initialize(user)
    @user = user
  end

  def current_release
    @_current_release ||= Release.current
  end

  def next_release
    @_next_release ||= current_release.next
  end

  def previous_release
    @_previous_release ||= current_release.next
  end

end
