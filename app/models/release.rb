class Release < ActiveRecord::Base

  has_many :issues
  has_many :series, :through => :issues, :uniq => true

  def r_date
    DateTime.strptime(self.ship_date, "%m/%d/%Y")
  end

  def issues_by_series
    return @issues_by_series if @issue_by_series.present?

    #collection = Hash.new([])
    collection = {}
    issues.each do |issue|
      #binding.pry
      collection[issue.series] ||= []
      collection[issue.series] << issue
    end
    @issues_by_series = collection
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
