class Release < ActiveRecord::Base

  has_many :issues
  has_many :series, :through => :issues
  #accepts_nested_attributes_for :issues
end
