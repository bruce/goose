require 'rubygems'
require 'rake'
require 'rake/testtask'

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "goose/version"

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end
 
task :build do
  system "gem build goose.gemspec"
end
 
task :release => :build do
  system "gem push goose-#{Goose::VERSION}.gem"
end

task :default => :test
