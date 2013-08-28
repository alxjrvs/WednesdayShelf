class Series < ActiveRecord::Base
  belongs_to :publisher
  has_many :issues
  has_many :releases, through: :issues
end
