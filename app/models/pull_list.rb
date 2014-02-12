class PullList < ActiveRecord::Base
  belongs_to :user
  has_many :pulls
  has_many :series, through: :pulls
  has_many :issues, through: :series

  def issues
    Issue.where(series_id: series.pluck(:id))
  end

  def issues_by_release(release)
    issues.where(release: release)
  end

  def total_price_per_release(release)
    issues_by_release(release).sum(:price)
  end

end
