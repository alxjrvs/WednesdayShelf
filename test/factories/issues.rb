FactoryGirl.define do
  factory :issue do
    title "Green Lantern #15"
    description "Green Lantern does a thing!"
    diamond_no "OCT120201"
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

  factory :cancelled_issue, class: Issue do
    title "FINE & PRIVATE PLACE #3 (OF 5)"
    description "This is cancelled!"
    diamond_no "SEP120367"
    stock_no "STK475608"
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
