class IssueSerializer < ActiveModel::Serializer
  attributes :id,
    :raw_title,
    :stock_number,
    :diamond_number,
    :description,
    :release_date,
    :price,
    :title,
    :series_title,
    :special_issue_number,
    :issue_number,
    :max_issue,
    :author,
    :artist,
    :cover_artist,
    #:series,
    :grid_cover_url,
    :cover_url
  has_many :variants


  def grid_cover_url
    object.cover.grid_cover.url
  end

  def cover_url
    object.cover.url
  end

end
