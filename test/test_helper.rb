ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/unit"
require "minitest/pride"
require "database_cleaner"
require "capybara/rails"

Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }

DatabaseCleaner.strategy = :transaction

class WednesdayShelfTest < MiniTest::Unit::TestCase
  include FactoryGirl::Syntax::Methods

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  def start_cleaner
    DatabaseCleaner.start
  end
end

class AcceptanceTest < WednesdayShelfTest
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  include Capybara::Assertions

  def teardown
    super
    Capybara.reset_session!
    Capybara.use_default_driver
  end

end

class ModelTest < WednesdayShelfTest
  include FactoryGirl::Syntax::Methods

  def assert_valid_factory(model)
    model_var = create model
    assert model_var.valid?
  end
end
