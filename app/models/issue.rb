class Issue < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :variant
  belongs_to :series
  belongs_to :release

  has_attached_file :cover,
      :path => ":rails_root/app/assets/images/covers/:filename",
      :url => ":rails_root/public/images/covers/:filename",
      :styles => { :home => "150x230"}
end
