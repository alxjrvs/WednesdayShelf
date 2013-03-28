ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "vcr"
require "rails/test_help"
require "minitest/rails"
require "minitest/spec"
require "minitest/autorun"
require "minitest/pride"
require "factory_girl"

class MiniTest::Spec
  include FactoryGirl::Syntax::Methods
end

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock # or :fakeweb
  c.default_cassette_options = { record: :new_episodes }
end

class ActiveSupport::TestCase

end
