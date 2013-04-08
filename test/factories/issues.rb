# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue do
    title
    description
    diamond_no
    stock_no
    writer
    artist
    cover_artist
    issue_no
    max_issue
    price
  end
end
