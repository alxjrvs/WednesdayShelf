ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require 'minitest/autorun'
require "minitest/unit"
require "minitest/pride"
require "minitest/rails/capybara"
require 'pry'
require "factory_girl"

Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }


CarrierWave.configure do |config|
  config.storage = :file #this will be ignored. Need better solution
  config.enable_processing = false
end

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

class WednesdayShelfTest < ActiveSupport::TestCase
end

class FeatureTest < WednesdayShelfTest
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  include Capybara::Assertions

  def teardown
    super
    Capybara.reset_session!
    Capybara.use_default_driver
  end

  def setup
    super
  end

end

module LateralNavigation

  def assert_next_nav(start_path: prime_path, target_path: target_path)
    visit start_path

    within "#lateral-nav" do
      click_on "nav-right"
    end

    assert_equal target_path, page.current_path
  end

  def assert_previous_nav(start_path: start_path, target_path: target_path)
    visit start_path

    within "#lateral-nav" do
      click_on "nav-left"
    end

    assert_equal target_path, page.current_path
  end

end

class ModelTest < WednesdayShelfTest
  include FactoryGirl::Syntax::Methods

  def assert_valid(model)
    assert model.valid?
  end

  def refute_valid(model)
    refute model.valid?
  end

  def assert_valid_factory(model)
    model_var = create model
    assert model_var.valid?
  end
end
