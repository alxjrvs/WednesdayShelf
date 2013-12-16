class Issue < ActiveRecord::Base
  validates :homing_string, uniqueness: true
  validates :diamond_number, uniqueness: true

  belongs_to :series
  belongs_to :release
  has_many :covers


  def hero_cover
    covers.where(issue_id: id, diamond_number: diamond_number).first ||
      covers.first ||
      Cover.default_hero
  end

  def next
    @_next ||= future.first
  end

  def previous
    @_previous ||= past.first
  end

  def clean_title
    number = issue_number ? "##{issue_number}" : ''
    humancase("#{series.title} #{number}")
  end

  def future
    Issue.where('raw_title > ? AND series_id = ?', raw_title, series.id).order('raw_title ASC')
  end

  def past
    Issue.where('raw_title < ? AND series_id = ?', raw_title, series.id).order('raw_title DESC')
  end

  private

  def humancase(string)
    string.downcase.split.map(&:capitalize).join(' ')
  end

end
