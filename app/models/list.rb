class List < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :pulls
  has_many :titles, :through => :pulls
  belongs_to :store
  belongs_to :user
end

