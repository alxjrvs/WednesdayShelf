class PullList < ActiveRecord::Base
  belongs_to :user
  has_many :pulls
  has_many :series, through: :pulls
end
