require 'rubygems'
require 'rake'
require 'rake/testtask'

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "goose/version"

task :build do
  system "gem build goose.gemspec"
end
 
task :release => :build do
  system "gem push goose-#{Goose::VERSION}.gem"
end

task :default => :spec

require 'rspec/core/rake_task'
desc "Run specs"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w(--color)
end
namespace :spec do
  desc "Run specs with output in documentation format"
  RSpec::Core::RakeTask.new(:doc) do |t|
    t.rspec_opts = ["--color", "--format d"]
  end
end

require 'yard'
YARD::Rake::YardocTask.new do |t|
  t.files = ['lib/**/*.rb', '-', 'CHANGELOG', 'LICENSE']
  t.options = ['--no-private', '--title', 'goose API Documentation']
end

