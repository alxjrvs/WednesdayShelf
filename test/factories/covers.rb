FactoryGirl.define do
  factory :cover do
    issue
    cover_artist "Jim Starlin, Rob Hunter"
    diamond_number "SEP130253"
    homing_string "STORMWATCH_25_#{Date.current.year}"
  end
end
