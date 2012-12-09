class Issue < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :variants
  belongs_to :series
  belongs_to :release

  has_attached_file :cover,
      :path => ":rails_root/app/assets/images/covers/:filename",
      :url => ":rails_root/public/assets/covers/:filename",
      :styles => { :small => "150x230", :medium => "300x460"}

end
