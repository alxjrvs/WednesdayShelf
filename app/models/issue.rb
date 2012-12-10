class Issue < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :variants
  belongs_to :series
  belongs_to :release

  has_attached_file :cover,
      styles: {
        :small => ["150x230", :png],
        :medium => ["300x460", :png]
        }
    #:url => "/system/assets/images/:class:attachment/:id_partition/:style/:basename.:extension",
    #:path => "app/assets/images/:class/:attachment/:id_partition/:style/:basename.:extension"

end
