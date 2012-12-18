require 'multi_json'

module Foxit
  module Request

    def delete(path, options={})
      request(:delete, path, options).body
    end

    def get(path, options={})
      response = request(:get, path, options).body
    end

    def patch(path, options={})
      request(:patch, path, options).body
    end

    def post(path, options={})
      request(:post, path, options).body
    end

    def put(path, options={})
      request(:put, path, options).body
    end

    private

    # Executes the request, checking if it was successful
    #
    # @return [Boolean] True on success, false otherwise
    def boolean_from_response(method, path, options={})
     request(method, path, options).status == 204
    rescue Foxit::NotFound
      false
    end

    def request(method, path, options={})
      path.sub!(%r{^/}, '')

      token = options.delete(:private_token) ||
              private_token

      response = connection.send(method) do |request|

        if token
          request.headers[:private_token] = token
        end

        case method
        when :get
          if auto_traversal && per_page.nil?
            self.per_page = 100
          end
          options.merge!(:per_page => per_page) if per_page
          request.url(path, options)
        when :delete, :head
          request.url(path, options)
        when :patch, :post, :put
          request.path = path
          request.body = MultiJson.dump(options) unless options.empty?
        end

        if Foxit.request_host
          request.headers['Host'] = Foxit.request_host
        end
      end
      response
    end
  end
end
