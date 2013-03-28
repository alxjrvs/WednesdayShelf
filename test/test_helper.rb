ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/spec"
require "minitest/autorun"
require "minitest/pride"
require "factory_girl"

class MiniTest::Spec
    include FactoryGirl::Syntax::Methods
end

class ActiveSupport::TestCase

end
