class Pull < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :list
  belongs_to :series
end
