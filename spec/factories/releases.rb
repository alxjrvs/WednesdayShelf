FactoryGirl.define do
  factory :release do
    date Date.current

    trait :current do
      date Date.current
    end

    trait :next do
      date Date.current + 7
    end

    trait :previous do
      date Date.current - 7
    end
  end
end
