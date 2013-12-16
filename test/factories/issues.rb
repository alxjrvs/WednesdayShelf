FactoryGirl.define do
  factory :issue do
    release {FactoryGirl.create(:release, :current)}
    series
    raw_title 'STORMWATCH #25'
    stock_number 'STK624619'
    homing_string "STORMWATCH_25_#{Date.current.year}"
    diamond_number "SEP130253"
    description 'A THING HAPPENS TO THE CHARCTERS'
    price 2.99
    title 'STORMWATCH #25'
    special_issue_number '25'
    issue_number 25
    max_issue nil
    author "Jim Starlin"

    trait :next do
      release {FactoryGirl.create(:release, :next)}
      homing_string "NEXT ISSUE" 
      diamond_number "AUG13NEXT"
      raw_title "STORMWATCH #26"
    end

    trait :previous do
      release {FactoryGirl.create(:release, :previous)}
      homing_string "PREVIOUS ISSUE" 
      diamond_number "AUG13PREV"
      raw_title "STORMWATCH #24"
    end

  end
end
