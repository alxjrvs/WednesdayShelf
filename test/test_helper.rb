ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/autorun"
require "minitest/pride"
require "factory_girl"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output

class MiniTest::Rails::ActiveSupport::TestCase
    include FactoryGirl::Syntax::Methods
end

class ActiveSupport::TestCase
  fixtures :all

end
