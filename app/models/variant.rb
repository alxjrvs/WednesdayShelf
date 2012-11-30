class Variant < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :issue
end
