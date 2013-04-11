# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue_cancel_checker do
    ignore do
      doc {build(:popup_hasher).get_html}
      issue {create(:issue)}
    end
    factory :cancelled_issue_cancel_checker, class: IssueCancelChecker do
      ignore do
        issue {create(:cancelled_issue)}
        doc {build(:cancelled_popup_hasher).get_html}
      end
    end
    initialize_with {new(doc, issue)}
  end
end
