class ReleaseSorter
  def initialize(release)
    @release_day = release.ship_date.to_s
  end
  def next_week
    Release.where(ship_date: DateTime.parse(@release_day) + 7.days)[0]
  end

  def last_week
    Release.where(ship_date: DateTime.parse(@release_day) - 7.days)[0]
  end
end
