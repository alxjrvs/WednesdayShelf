class Release < ActiveRecord::Base
  has_many :issues
  #I feel this will become truer with time.

  validates :release_date, presence: true, uniqueness: true


  private

  def is_a_wednesday
    release_date.strftime('%A') == 'Wednesday'
  end

end
