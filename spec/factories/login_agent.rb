FactoryGirl.define do
  factory :login_agent  do
    #vcr
    initialize_with {LoginAgent.new}
  end
end
