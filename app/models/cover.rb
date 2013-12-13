class Cover < ActiveRecord::Base
  validates :diamond_number, uniqueness: true
  belongs_to :issue

  mount_uploader :image, CoverUploader

  def cover_file_name
    "#{homing_string.underscore}_#{diamond_number}.png"
  end
end
