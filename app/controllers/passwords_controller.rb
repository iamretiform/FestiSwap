class PasswordsController < Devise::PasswordsController
  def edit
    self.resource = resource_class.find_or_initialize_with_error_by(:reset_password_token, params[:reset_password_token])
    if !resource.errors.empty?
      flash[:alert] = "Password token is invalid"
      redirect_to new_session_path(resource_name)
    end
  end
end
