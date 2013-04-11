# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :popup_hasher do
    ignore do
      agent {build(:login_agent).login}
      diamond_code {create(:issue).diamond_no}
    end

    factory :cancelled_popup_hasher, class: PopupHasher do
      ignore do
        diamond_code {create(:cancelled_issue).diamond_no}
      end
    end

    initialize_with {new(diamond_code, agent)}
  end
end
