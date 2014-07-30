Rails::TestTask.new("test:presenters" => "test:prepare") do |t|
    t.pattern = "test/presenters/**/*_test.rb"
end
