class Issue < ActiveRecord::Base
  validates :homing_string, uniqueness: true
  validates :diamond_number, uniqueness: true

  belongs_to :series
  belongs_to :release
  has_many :covers

  def hero_cover
    Cover.where(issue_id: id, diamond_number: diamond_number).first
  end

end
