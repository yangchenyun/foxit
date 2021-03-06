module Foxit
  # Custom error class for rescuing from all GitLab errors
  class Error < StandardError; end

  # Raised when GitLab returns a 400 HTTP status code
  class BadRequest < Error; end

  # Raised when GitLab returns a 401 HTTP status code
  class Unauthorized < Error; end

  # Raised when GitLab returns a 403 HTTP status code
  class Forbidden < Error; end

  # Raised when GitLab returns a 404 HTTP status code
  class NotFound < Error; end

  # Raised when GitLab returns a 406 HTTP status code
  class NotAcceptable < Error; end

  # Raised when GitLab returns a 422 HTTP status code
  class UnprocessableEntity < Error; end

  # Raised when GitLab returns a 500 HTTP status code
  class InternalServerError < Error; end

  # Raised when GitLab returns a 501 HTTP status code
  class NotImplemented < Error; end

  # Raised when GitLab returns a 502 HTTP status code
  class BadGateway < Error; end

  # Raised when GitLab returns a 503 HTTP status code
  class ServiceUnavailable < Error; end

  # Raised when web_endpoint is not provided
  class NoWebEndPoint < Error; end

  # Raised when private_token is not provided
  class NoPrivateToken < Error; end
end
