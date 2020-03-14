module AuthHelper
  def http_login
    user = 'admin'
    pw = Rails.application.credentials[ENV['RAILS_ENV'].to_sym][:password]
    request.env['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end
end