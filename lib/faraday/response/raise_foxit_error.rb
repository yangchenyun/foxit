require 'faraday'
require 'multi_json'

# @api private
module Faraday
  class Response::RaiseFoxitError < Response::Middleware
    ERROR_MAP = {
      400 => Foxit::BadRequest,
      401 => Foxit::Unauthorized,
      403 => Foxit::Forbidden,
      404 => Foxit::NotFound,
      406 => Foxit::NotAcceptable,
      422 => Foxit::UnprocessableEntity,
      500 => Foxit::InternalServerError,
      501 => Foxit::NotImplemented,
      502 => Foxit::BadGateway,
      503 => Foxit::ServiceUnavailable
    }

    def on_complete(response)
      key = response[:status].to_i
      raise ERROR_MAP[key], error_message(response) if ERROR_MAP.has_key? key
    end

    def error_message(response)
      message = if (body = response[:body]) && !body.empty?
        if body.is_a?(String)
          body = MultiJson.load(body, :symbolize_keys => true)
        end
        ": #{body[:error] || body[:message] || ''}"
      else
        ''
      end
      errors = unless message.empty?
        body[:errors] ?  ": #{body[:errors].map{|e|e[:message]}.join(', ')}" : ''
      end
      "#{response[:method].to_s.upcase} #{response[:url].to_s}: #{response[:status]}#{message}#{errors}"
    end
  end
end
