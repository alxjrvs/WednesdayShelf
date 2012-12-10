class Variant < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :issue
  has_attached_file :cover,
      styles: {
        :small => ["150x230", :png],
        :medium => ["300x460", :png]
        }
end
