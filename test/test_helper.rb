ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/unit"
require "minitest/pride"
require "database_cleaner"

Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }

DatabaseCleaner.strategy = :transaction

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

module ModelMethods
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  def factory_is_valid?(model)
    model_var = create model
    assert_equal true, model_var.valid?
  end

  def start_cleaner
    DatabaseCleaner.start
  end
end

module AcceptanceMethods
  def teardown
    Capybara.reset_session!
    Capybara.use_default_driver
  end
end

class AcceptanceTests < MiniTest::Unit::TestCase
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  include AcceptanceMethods
end

class ModelTests < MiniTest::Unit::TestCase
  include FactoryGirl::Syntax::Methods
  include ModelMethods
end
