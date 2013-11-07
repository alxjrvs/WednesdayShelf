class Release < ActiveRecord::Base
  has_many :issues, -> {order('issues.series_title')}
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

  def next
    return @_next if @_next.present?
    if current_index == Release.all.size
      @_next = nil
    else
      @_next= Release.all[current_index + 1]
    end
  end

  def previous
    return @_previous if @_previous.present?
    if current_index == 0
      @_previous = nil
    else
      @_previous = Release.all[current_index - 1]
    end
  end


  private

  def current_index
    Release.all.index(self)
  end

  def is_a_wednesday
    release_date.strftime('%A') == 'Wednesday'
  end

end
