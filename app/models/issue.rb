class Issue < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :variant
  belongs_to :series
  belongs_to :release

  has_attached_file :cover, :path => ":rails_root/app/assets/images/covers/:filename"

end
