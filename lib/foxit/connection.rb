require 'faraday_middleware'
require 'faraday/response/raise_foxit_error'

module Foxit
  # @private
  module Connection
    private

    def connection(options={})
      options = {
        :force_urlencoded => false,
        :raw              => false,
        :ssl              => { :verify => false },
        :url              => "#{web_endpoint}/api/v2/"
      }.merge(options)

      # TODO: Don't build on every request
      connection = Faraday.new(options) do |builder|

        builder.request :json

        builder.use Faraday::Response::RaiseFoxitError
        builder.use FaradayMiddleware::FollowRedirects
        builder.use FaradayMiddleware::Mashify

        builder.use FaradayMiddleware::ParseJson, :content_type => /\bjson$/

        faraday_config_block.call(builder) if faraday_config_block

        builder.adapter *adapter
      end

      connection.headers[:user_agent] = user_agent

      connection
    end
  end
end
