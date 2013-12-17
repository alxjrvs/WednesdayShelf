class Cover < ActiveRecord::Base
  validates :diamond_number, uniqueness: true

  delegate :grid_cover, to: :image
  delegate :highlight_cover, to: :image

  belongs_to :issue

  mount_uploader :image, CoverUploader

  def self.default_hero
    Cover.where(diamond_number: "DEFAULT_COVER").first_or_create do |c|
      c.homing_string = "DEFAULT_COVER"
      c.image = open(Rails.root.join('public/default_cover.png'))
      c.cover_artist = "Alex Jarvis"
    end
  end

  def cover_file_name
    "#{homing_string}_#{diamond_number}".parameterize + ".png"
  end

end
