class Store < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :lists
  has_many :users
end
