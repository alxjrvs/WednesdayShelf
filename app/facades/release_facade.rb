class ReleaseFacade
  attr_reader :release

  def initialize(release)
    @release = release
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
