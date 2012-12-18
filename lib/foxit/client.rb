require 'foxit/connection'
require 'foxit/request'

require 'foxit/client/users'
require 'foxit/client/projects'
require 'foxit/client/snippets'
require 'foxit/client/repositories'
require 'foxit/client/issues'
require 'foxit/client/milestones'
require 'foxit/client/notes'

module Foxit
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options={})
      options = Foxit.options.merge(options)

      if !options.has_key?(:endpoint)
        raise Foxit::NoWebEndPoint
      end
      if !options.has_key?(:private_token)
        raise Foxit::NoPrivateToken
      end

      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include Foxit::Connection
    include Foxit::Request

    include Foxit::Client::Users
    include Foxit::Client::Projects
    include Foxit::Client::Snippets
    include Foxit::Client::Repositories
    include Foxit::Client::Issues
    include Foxit::Client::Milestones
    include Foxit::Client::Notes
  end
end
