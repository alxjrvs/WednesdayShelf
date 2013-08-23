class Release < ActiveRecord::Base
  has_many :issues
  #I feel this will become truer with time.
end
