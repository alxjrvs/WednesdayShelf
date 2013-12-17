class Release < ActiveRecord::Base
  has_many :issues, -> {order('issues.title').includes :covers}
  #I feel this will become truer with time.
  has_many :series, through: :issues

  validates :date, presence: true, uniqueness: true

  default_scope {order('date ASC')}

  def self.future(date = Date.current)
    where("date >= ?", date).order('date ASC')
  end

  def self.past(date = Date.current)
    where("date < ?", date).order('date DESC')
  end

  def self.current
    future.first || past.first
  end

  def next
    if Release.future(date).include?(self)
      Release.future(date)[1]
    else
      Release.future(date).first
    end
  end

  def previous
    @_previous ||= Release.past(date).first
  end

  private

  def is_a_wednesday
    date.strftime('%A') == 'Wednesday'
  end

end
