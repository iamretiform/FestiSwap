class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: %i[delete_user_photo]
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session

  def delete_user_photo
    current_user.avatar.destroy
    redirect_to edit_user_registration_path, notice: 'Photo has successfully been removed.'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password about locale avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password about locale avatar])
  end
end
