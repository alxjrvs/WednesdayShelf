class Series < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :issues
  has_many :pulls
  has_many :lists, :through => :pulls
  has_many :releases, :through => :issues
end
