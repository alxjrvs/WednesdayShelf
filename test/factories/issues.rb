FactoryGirl.define do
  factory :issue do
    release
    raw_title 'STORMWATCH #25'
    stock_number 'STK624619'
    series_title 'STORMWATCH'
    diamond_number "SEP130253"
    release_year Date.current.year
    description 'A THING HAPPENS TO THE CHARCTERS'
    price 2.99
    title 'STORMWATCH #25'
    special_issue_number '25'
    issue_number 25
    max_issue nil
    author "Jim Starlin"
    cover_artist "Jim Starlin, Rob Hunter"
  end
end
