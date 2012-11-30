class Issue < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :variant
  belongs_to :title, :release

end
