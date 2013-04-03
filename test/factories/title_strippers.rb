FactoryGirl.define do
  factory :title_stripper do
    ignore do
      string "FANTASTIC FOUR #15 DOBSON VAR COVER"
      substring "DOBSON VAR COVER "
    end
    initialize_with {new(string, substring)}
  end
end
