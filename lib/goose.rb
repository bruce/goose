module Goose

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

  # Not recommended for production use.
  def self.eject! #:nodoc:
    raise NotImplementedError, "BOOM...Crunch"
  end
  
end

require 'goose/ext/action_view'
