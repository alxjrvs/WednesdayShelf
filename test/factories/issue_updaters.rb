FactoryGirl.define do
  factory :issue_updater do
    ignore do
      agent {build(:login_agent).login}
      issue {create(:issue)}
    end

    factory :cancelled_issue_updater do
      ignore do
        issue {create(:cancelled_issue)}
      end
    end
    initialize_with {new(issue, agent)}
  end

end
