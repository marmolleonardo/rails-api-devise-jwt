class ApiController < ActionController::API
  # Base controller for JSON API endpoints
  # No CSRF protection needed as we're using JWT
  respond_to :json
  include ActionController::MimeResponds
end
