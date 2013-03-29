ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
Dir[Rails.root.join("test/expectations/*.rb")].each {|f| require f}
require "rails/test_help"
require "minitest/rails"
require "minitest/pride"
require "minitest/autorun"
require "factory_girl"
require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock # or :fakeweb
  c.default_cassette_options = { record: :new_episodes}
end

module TestCaseBehavior
  extend ActiveSupport::Concern

  included do
    before do
      VCR.insert_cassette(__name__)
    end

    after do
      VCR.eject_cassette
    end
  end
end

class MiniTest::Spec
  include FactoryGirl::Syntax::Methods
  include TestCaseBehavior
end
