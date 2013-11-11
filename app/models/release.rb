class Release < ActiveRecord::Base
  has_many :issues, -> {order('issues.series_title')}
  #I feel this will become truer with time.
  has_many :series, through: :issues

  validates :release_date, presence: true, uniqueness: true

  default_scope {order('release_date ASC')}
  scope :future, -> {where("release_date >= ?", Date.today - 3.days)}

  def self.current
    future[0]
  end

  def next
    @_next ||= Release.all[current_index + 1]
  end

  def previous
    @_previous ||= Release.all[current_index - 1]
  end

  def pretty_release_date
    release_date.stamp "Wednesday, August 31st"
  end

  private

  def current_index
    Release.all.index(self)
  end

  def is_a_wednesday
    release_date.strftime('%A') == 'Wednesday'
  end

end
