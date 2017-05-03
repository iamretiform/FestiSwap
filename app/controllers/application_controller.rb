class ApplicationController < ActionController::Base
  before_action :redirect_to_https
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password about locale avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name about locale avatar])
  end

  def redirect_to_https
      redirect_to :protocol => "https://" unless (request.ssl? || request.local?)
  end
end
