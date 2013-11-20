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

  def clean_title
    humancase("#{series.title} ##{issue_number}")
  end

  private

  def humancase(string)
    string.downcase.split.map(&:capitalize).join(' ')
  end

end
