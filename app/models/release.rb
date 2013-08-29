class Release < ActiveRecord::Base
  has_many :issues
  #I feel this will become truer with time.
  has_many :series, through: :issues

  validates :release_date, presence: true, uniqueness: true
  default_scope {order('release_date ASC')}

  def self.future
    Release.where("release_date >= ?", Date.today - 3.days)
  end

  def self.current
    future[0]
  end

  private

  def is_a_wednesday
    release_date.strftime('%A') == 'Wednesday'
  end

end
