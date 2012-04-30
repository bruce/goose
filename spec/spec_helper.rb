require "rubygems"
require "bundler/setup"

require 'action_view'
require 'action_controller'
require 'nokogiri'
require 'goose'

require 'rspec'

RSpec.configure do |config|
  config.fail_fast = true
  config.mock_with :rspec
end
