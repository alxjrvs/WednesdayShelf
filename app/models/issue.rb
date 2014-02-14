class Issue < ActiveRecord::Base
  validates :homing_string, uniqueness: true
  validates :diamond_number, uniqueness: true

  belongs_to :series
  belongs_to :release
  has_many :covers
  delegate :cover_artist, to: :hero_cover
  delegate :publisher, to: :series
  delegate :date, to: :release

  default_scope {includes(:series)}

  def self.find_by_diamond_number(dn)
    where(diamond_number: dn).first
  end

  def hero_cover
    covers.where(issue_id: id, diamond_number: diamond_number).first ||
      covers.first ||
      Cover.default_hero
  end

  def variant_covers
    covers - hero_cover
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
    @_future ||=
      Issue.joins(:release).where('releases.date >= ? AND raw_title > ? AND series_id = ?', date, raw_title, series.id).order('releases.date ASC, raw_title ASC')
  end

  def past
    @_past ||=
      Issue.joins(:release).where('releases.date <= ? AND raw_title < ? AND series_id = ?', date, raw_title, series.id).order('releases.date DESC, raw_title DESC')
  end

  private

  def humancase(string)
    string.downcase.split.map(&:capitalize).join(' ')
  end

end
