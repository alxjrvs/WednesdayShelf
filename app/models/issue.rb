class Issue < ActiveRecord::Base

  mount_uploader :cover, CoverUploader

  belongs_to :series
  has_many :variants

  def self.uplift!(item)
    publisher = Publisher.where(name: item.publisher).first_or_create
    series = Series.where(name: item.series_title, publisher_id: publisher.id).first_or_create
    issue = where(
      raw_title: item.raw_title,
      stock_number: item.stock_number, 
      diamond_number: item.diamond_number,
      description: item.description,
      release_date: item.release_date,
      price: item.price,
      title: item.title,
      series_title: item.series_title,
      special_issue_number: item.special_number,
      issue_number: item.issue_number,
      max_issue: item.limited_series_max_issue,
      author: item.author,
      artist: item.artist,
      cover_artist: item.cover_artist,
      series: series,
      release_year: item.release_year
    ).first_or_create
    issue.find_variants
    #issue.update_cover(item.image)
  end


  def cover_file_name
    series_title + issue_number.to_s + "Cover" + '.png'
  end

  def update_cover(image)
    self.cover = image
    self.cover.save!
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
