class Release < ActiveRecord::Base
  has_many :issues, -> {order('issues.title')}
  #I feel this will become truer with time.
  has_many :series, through: :issues

  validates :date, presence: true, uniqueness: true

  default_scope {order('date ASC')}
  scope :nearest, -> {where("date >= ? OR date<=?",Date.current, Date.current).order('date DESC')}

  def self.future(date = Date.current)
    where("date > ?", date)
  end

  def self.past(date = Date.current)
    where("date < ?", date)
  end

  def self.current
    nearest.first
  end

  def next
    @_next ||= Release.future(date).first
  end

  def previous
    @_previous ||= Release.past(date).first
  end

  def pretty_date
    date.stamp "Wednesday, August 31st"
  end

  private

  def is_a_wednesday
    date.strftime('%A') == 'Wednesday'
  end

end
