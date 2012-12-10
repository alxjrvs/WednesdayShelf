class Variant < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :issue
  has_attached_file :cover,
      styles: {
        :small => ["150x230", :png],
        :medium => ["300x460", :png]
        }
    #:path =>":rails_root/app/assets/images/:class/:attachment/:id_partition/:style/:filename"
end
