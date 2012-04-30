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

  def self.wire!(rewire = false)
    unless rewire
      return if @wired
    end
    if defined?(ActionView::Base)
      ActionView::Base.send(:include, Goose::Helper)
    end
    @wired = true
  end
  
end

Goose.wire!
