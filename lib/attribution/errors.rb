module Attribution

  # Base class exception from which all public Attribution exceptions will be derived
  class AttributionError < StandardError
    attr_reader :http_code, :application_error_code
    def initialize(message, http_code = nil, error_code = application_error_code)
      @http_code = http_code
      @application_error_code = error_code
      super(message)
    end
  end

  # Raised when the credentials you provide don't match a valid account on Attribution.
  # Check that you have set <b>Attribution.project_id=</b> correctly.
  class AuthenticationError < AttributionError; end

  # Raised when something does wrong on within the Attribution API service.
  class ServerError < AttributionError; end

  # Raised when we have bad gateway errors.
  class BadGatewayError < AttributionError; end

  # Raised when we experience a socket read timeout
  class ServiceUnavailableError < AttributionError; end

  # Raised when we experience socket connect timeout
  class ServiceConnectionError < AttributionError; end

  # Raised when requesting resources on behalf of a user that doesn't exist in your application on Attribution.
  class ResourceNotFound < AttributionError; end

  # Raised when the request has a bad syntax
  class BadRequestError < AttributionError; end

  # Raised when you have exceed the API rate limit
  class RateLimitExceeded < AttributionError; end

  # Raised when the request throws an error not accounted for
  class UnexpectedError < AttributionError; end
  
  # Raised when multiple users match the query (typically duplicate email addresses)
  class MultipleMatchingUsersError < AttributionError; end

  # Raised when you try to call a non-setter method that does not exist on an object
  class Attribution::AttributeNotSetError < AttributionError ; end
  
  # Raised when unexpected nil returned from server
  class Attribution::HttpError < AttributionError ; end

  #
  # Non-public errors (internal to the gem)
  #

  # Base class exception from which all public Attribution exceptions will be derived
  class AttributionInternalError < StandardError; end

  # Raised when we attempt to handle a method missing but are unsuccessful
  class Attribution::NoMethodMissingHandler < AttributionInternalError; end

  class Attribution::DeserializationError < AttributionInternalError; end
end
