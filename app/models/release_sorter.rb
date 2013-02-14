class ReleaseSorter
  def initialize(release)
    @release = release
    @release_array = Release.all.sort_by(&:ship_date)
  end
  def release_index
    @release_array.index(@release)
  end
  def next_week
    @release_array[release_index + 1]
  end

  def last_week
    @release_array[release_index - 1]
  end
end
