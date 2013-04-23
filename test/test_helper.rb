ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "minitest/autorun"
require "minitest/rails"
require "minitest/pride"

require "factory_girl"
require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock # or :fakeweb
  c.default_cassette_options = { record: :new_episodes}
end

class WednesdayShelfTest < Minitest::Spec
  include FactoryGirl::Syntax::Methods
end

class IntegrationTest < WedneshdayShelfTest
end

IntegrationTest.add_setup_hook { VCR.insert_cassette(__name__) }
IntegrationTest.add_teardown_hook { VCR.eject_cassette }

class UnitTest < WednesdayShelfTest
end
