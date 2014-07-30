require File.expand_path('../config/application', __FILE__)
require 'rake/testtask'

WednesdayShelf::Application.load_tasks

 
Rake::TestTask.new do |t|
  t.libs.push 'test'
  t.pattern = 'test/**/*_test.rb'
end

task :default => ["test"]

