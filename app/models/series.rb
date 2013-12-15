class Series < ActiveRecord::Base
  belongs_to :publisher
  has_many :issues, -> {order 'raw_title ASC'}
  has_many :releases, through: :issues
  has_many :pulls
  has_many :pull_lists, through: :pulls
end
