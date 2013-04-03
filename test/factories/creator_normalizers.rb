# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :creator_normalizer do
    factory :single_creator, class: CreatorNormalizer do
      ignore do
        creator "Morrison, Grant"
      end
      initialize_with {new(creator)}
    end
    factory :multiple_creators, class: CreatorNormalizer do
      ignore do
        creator "Grant Morrsion ; Jack Kirby"
      end
      initialize_with {new(creator)}
    end
  end
end
