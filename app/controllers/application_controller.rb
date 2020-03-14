class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :http_basic_authenticate, only: [:update, :create, :destroy]

  include ExceptionHandler
  include Response

  def http_basic_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password ==
        Rails.application.credentials[ENV['RAILS_ENV'].to_sym][:password]
    end
  end
end
