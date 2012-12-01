class Issue < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :variant
  belongs_to :series
  belongs_to :release

end
