require 'foxit/configuration'
require 'foxit/error'
require 'foxit/client'

module Foxit
  extend Configuration
  class << self
    # Alias for foxit::Client.new
    #
    # @return [foxit::Client]
    def new(options={})
      Foxit::Client.new(options)
    end

    # Delegate to foxit::Client.new
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
