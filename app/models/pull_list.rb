class PullList < ActiveRecord::Base
  belongs_to :user
  has_many :pulls
  has_many :series, through: :pulls

  def issues
    Issue.where(series_id: series.map(&:id))
  end

  def issues_by_release(release)
    issues.where(release: release)
  end

  def price_by_release(release)
    issues_by_release(release).map(&:price).sum
  end
end
