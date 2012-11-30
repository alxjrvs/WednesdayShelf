class Title < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :issues
  has_many :pulls
  has_many :lists, :through => :pulls
end
