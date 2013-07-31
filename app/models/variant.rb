class Variant < ActiveRecord::Base

  def self.uplift!(item)
    variant = where(
      variance: item.variant_description,
      raw_title: nil,
      series_name: item.series_name,
      issue_number: item.issue_number,
      release_year: item.release_year,
      author: item.author,
      artist: item.artist,
      cover_artist: item.cover_artist
    ).first_or_create
    variant.find_issue
  end

  private

  def find_issue
    issue = Issue.where(
      series_name: series_name,
      issue_number: issue_number,
      release_year: release_year
    ).first
    update_attributes(issue: issue) if issue
  end
end
