class Issue < ActiveRecord::Base

  #TODO: What if there are two comic with the same series? 
  # we need a way to compare diamond numebers to see if the year codes match.
  def self.uplift!(item)
    publisher = Publsiher.where(name: item.publisher).first_or_createm,
    series = Series.where(name: item.series_name, publisher: publisher).first_or_create,
    issue = where(
      raw_title: item.raw_title,
      stock_number: item.stock_number, 
      diamond_number: item.diamond_number,
      description: item.description,
      release_date: item.release_date,
      cover: nil,
      price: item.price,
      title: item.title,
      series_name: item.series_name,
      special_issue_number: item.special_number,
      issue_number: item.issue_number,
      max_issue: item.limited_series_max_issue,
      author: item.author,
      artist: item.artist,
      cover_artist: item.cover_artist,
      publisher: publisher,
      series: series,
    ).first_or_create.
    issue.find_variants
  end

  private

  def find_variants
    variants = Variant.where(
      series_name: series_name,
      issue_number: issue_number,
      release_year: release_year
    )
    variants.each {|v| v.update_attributes(issue: self)} if variants

  end

end
