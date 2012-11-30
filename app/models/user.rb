class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :lists
  belongs_to :store
end
