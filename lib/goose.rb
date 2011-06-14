module Goose

  autoload :Address, 'goose/address'
  autoload :Config,  'goose/config'
  autoload :Helper,  'goose/helper'
  autoload :State,   'goose/state'
  autoload :VERSION, 'goose/version'

  def self.config
    @config ||= Config.new
  end

  def self.setup(&block)
    yield config
  end
  
end

require 'goose/ext/action_view'
