FactoryGirl.define do
  factory :issue do
    release
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
  end
end
