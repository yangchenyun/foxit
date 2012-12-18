require 'faraday'
require 'foxit/version'

module Foxit
  module Configuration
    VALID_OPTIONS_KEYS = [
      :adapter,
      :faraday_config_block,
      :api_version,
      :api_endpoint,
      :web_endpoint,
      :private_token,
      :user_agent,
      :request_host,
      :auto_traversal,
      :per_page].freeze

    DEFAULT_ADAPTER        = Faraday.default_adapter
    DEFAULT_API_VERSION    = 2
    DEFAULT_WEB_ENDPOINT   = 'http://git.zenhacks.org'
    DEFAULT_API_ENDPOINT   = "#{DEFAULT_WEB_ENDPOINT}/api/v2"
    DEFAULT_USER_AGENT     = "Foxit Ruby Gem #{Foxit::VERSION}".freeze
    DEFAULT_AUTO_TRAVERSAL = false

    attr_accessor(*VALID_OPTIONS_KEYS)

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}){|o,k| o.merge!(k => send(k)) }
    end

    def api_endpoint=(value)
      @api_endpoint = File.join(value, "")
    end

    def web_endpoint=(value)
      @web_endpoint = File.join(value, "")
    end

    def faraday_config(&block)
      @faraday_config_block = block
    end

    def reset
      self.adapter        = DEFAULT_ADAPTER
      self.api_version    = DEFAULT_API_VERSION
      self.api_endpoint   = DEFAULT_API_ENDPOINT
      self.web_endpoint   = DEFAULT_WEB_ENDPOINT
      self.private_token  = nil
      self.request_host   = nil
      self.user_agent     = DEFAULT_USER_AGENT
      self.auto_traversal = DEFAULT_AUTO_TRAVERSAL
    end
  end
end

