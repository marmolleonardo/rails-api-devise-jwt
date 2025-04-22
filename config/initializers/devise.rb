# frozen_string_literal: true

# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  # ==> Controller configuration
  # Configure the parent class to the devise controllers.
  # config.parent_controller = "DeviseController"

  # ==> Mailer Configuration
  # Configure the e-mail address which will be shown in Devise::Mailer,
  # note that it will be overwritten if you use your own mailer class
  # with default "from" parameter.
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"

  # Configure the class responsible to send e-mails.
  # config.mailer = "Devise::Mailer"

  # Configure the parent class responsible to send e-mails.
  # config.parent_mailer = "ActionMailer::Base"

  # ==> ORM configuration
  # Load and configure the ORM. Supports :active_record (default) and
  # :mongoid (bson_ext recommended) by default. Other ORMs may be
  # available as additional gems.
  require "devise/orm/active_record"

  # ==> Configuration for any authentication mechanism
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [ :http_auth ]

  # ==> Configuration for :database_authenticatable
  config.stretches = Rails.env.test? ? 1 : 12

  # ==> Configuration for :validatable
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # ==> Configuration for :recoverable
  config.reset_password_within = 6.hours

  # ==> Navigation configuration
  config.sign_out_via = :delete

  # ==> OmniAuth
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.
  # config.omniauth :github, "APP_ID", "APP_SECRET", scope: "user,public_repo"

  # ==> Hotwire/Turbo configuration
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other

  # ==> JWT configuration
  config.jwt do |jwt|
    begin
      jwt.secret = ENV.fetch("SECRET_KEY_BASE") { Rails.application.credentials.secret_key_base }
    rescue
      jwt.secret = Rails.application.secret_key_base
    end
    
    jwt.dispatch_requests = [
      [ "POST", %r{^/login$} ]
    ]
    
    jwt.revocation_requests = [
      [ "DELETE", %r{^/logout$} ]
    ]
    
    jwt.expiration_time = 30.minutes.to_i
  end
end
