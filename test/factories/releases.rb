class ReleaseHelper
  def self.last_wednesday
    date = Date.today
    7.times do
      if date.wednesday? 
        return date
      else
        date = date - 1.day
      end
    end
  end
end
FactoryGirl.define do

  factory :release do
    release_date ReleaseHelper.last_wednesday
  end
end
