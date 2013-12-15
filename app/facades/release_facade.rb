class ReleaseFacade
  attr_reader :release, :user

  def initialize(release, user)
    @release = release
    @user = user
  end

  def current
    release
  end

  def next
    release.next
  end

  def previous
    release.previous
  end
end
