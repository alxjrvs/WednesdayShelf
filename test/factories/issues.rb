FactoryGirl.define do
  factory :issue do
    title "Green Lantern #15"
    description "Green Lantern does a thing!"
    diamond_no "AUG201221"
    stock_no "STK1234"
    writer "Geoff Johns"
    artist "Frank Quietly"
    cover_artist "Alan Moore"
    issue_no 15
    max_issue 0
    price 2.99
    release
    series
  end
end
