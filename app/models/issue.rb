class Issue < ActiveRecord::Base

  mount_uploader :cover, CoverUploader

  belongs_to :series
  belongs_to :release
  has_many :variants

  def self.uplift!(item)
    publisher = Publisher.where(name: item.publisher).first_or_create
    series = Series.where(title: item.series_title, publisher: publisher).first_or_create
    release = Release.where(release_date: item.release_date).first_or_create
    uplifted_issue = where(diamond_number: item.diamond_number).first_or_create do |issue|
      issue.raw_title = item.raw_title
      issue.stock_number = item.stock_number
      issue.series_title = item.series_title
      issue.diamond_number = item.diamond_number
      issue.description = item.description
      issue.price = item.price
      issue.title = item.title
      issue.release_year = item.release_year
      issue.special_issue_number = item.special_number
      issue.issue_number = item.issue_number
      issue.max_issue = item.limited_series_max_issue
      issue.author = item.author
      issue.artist = item.artist
      issue.cover_artist = item.cover_artist
      issue.series = series
      issue.release = release
      issue.cover = item.image
    end
    uplifted_issue.find_variants
  end

  def cover_file_name
    "#{series_title}_#{issue_number.to_s}_#{diamond_number}.png"
  end

  def find_variants
    variants = Variant.where(
      series_title: series_title,
      issue_number: issue_number,
      release_year: release_year
    )
    variants.each {|v| v.update_attributes(issue: self)} if variants
  end

  private

end
