class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def self.provides_callback_for(provider)
    class_eval %{
    def #{provider}
        @user = User.from_omniauth(request.env['omniauth.auth'])
        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
          set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
        else
          session["devise.#{provider}_data"] = env["omniauth.auth"]
          redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
        end
      end
  }
  end

  %i[facebook google_oauth2].each do |provider|
    provides_callback_for provider
  end
end
