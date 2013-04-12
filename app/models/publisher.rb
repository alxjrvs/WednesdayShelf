class Publisher < ActiveRecord::Base
  has_many :series, dependent: :destroy

end
