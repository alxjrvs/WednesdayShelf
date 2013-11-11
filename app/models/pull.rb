class Pull < ActiveRecord::Base
  belongs_to :series
  belongs_to :pull_list
end
