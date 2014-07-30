include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :cover do
    issue
    cover_artist "Jim Starlin, Rob Hunter"
    image {fixture_file_upload((Rails.root.join('test', 'fixtures', 'covers', 'example.jpg')), "image/jpg") }
    diamond_number "SEP130253"
    homing_string "STORMWATCH_25_#{Date.current.year}"
  end
end
