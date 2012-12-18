require 'foxit/connection'
require 'foxit/request'

require 'foxit/client/users'

module Foxit
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options={})
      options = Foxit.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include Foxit::Connection
    include Foxit::Request

    include Foxit::Client::Users
  end
end
