class Variant < ActiveRecord::Base

  mount_uploader :cover, CoverUploader

  belongs_to :issue

  def self.uplift!(item)
    uplifted_variant = where(diamond_number: item.diamond_number).first_or_create do |variant|
      variant.diamond_number = item.diamond_number
      variant.variant_description= item.variant_description
      variant.raw_title= item.raw_title
      variant.series_title= item.series_title
      variant.issue_number= item.issue_number
      variant.release_year= item.release_year
      variant.author= item.author
      variant.artist= item.artist
      variant.cover_artist= item.cover_artist
      variant.release_year= item.release_year
      variant.price= item.price
      variant.stock_number= item.stock_number
      variant.release_date= item.release_date
      variant.cover = item.image
    end
    uplifted_variant.find_issue
  end

  def cover_file_name
    "#{series_title}_#{issue_number.to_s}_#{diamond_number}_variant.png"
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
