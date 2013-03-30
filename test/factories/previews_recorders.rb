# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :previews_recorder do
    ignore do
      preview_hash {build(:source_weaver).weave}
    end
    initialize_with {new(preview_hash)}
  end
end
