class Release < ActiveRecord::Base

  has_many :issues
  has_many :series, :through => :issues

  def r_date
    DateTime.strptime(self.ship_date, "%m/%d/%Y")
  end

  def self.all_future
    all.sort_by(&:r_date).map do |release|
      release unless release.r_date < Date.today
    end.compact
  end

  def self.next
    all_future.first
  end
end

