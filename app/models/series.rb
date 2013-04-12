class Series < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :issues, dependent: :destroy
  has_many :pulls
  has_many :lists, :through => :pulls
  has_many :releases, :through => :issues, :uniq => true
  belongs_to :publisher
end
