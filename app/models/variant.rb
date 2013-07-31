class Variant < ActiveRecord::Base

  mount_uploader :cover, CoverUploader

  belongs_to :issue

  def self.uplift!(item)
    variant = where(
      diamond_number: item.diamond_number,
      variant_description: item.variant_description,
      raw_title: item.raw_title,
      series_title: item.series_title,
      issue_number: item.issue_number,
      release_year: item.release_year,
      author: item.author,
      artist: item.artist,
      cover_artist: item.cover_artist,
      release_year: item.release_year,
      price: item.price,
      stock_number: item.stock_number,
      release_date: item.release_date
    ).first_or_create
    variant.find_issue
    #variant.update_cover(item.image)
  end

  def update_cover(image)
    self.cover = image
    self.cover.save!
  end

  def cover_file_name
    series_title + issue_number.to_s + variant_description+ "Cover" + '.png'
  end

  def find_issue
    issue = Issue.where(
      series_title: series_title,
      issue_number: issue_number,
      release_year: release_year
    ).first
    update_attributes(issue: issue) if issue
  end

  private

end
