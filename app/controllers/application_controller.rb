class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |user|
      user.permit(
        :username, :email, :password, :password_confirmation, :location, :age,
        :first_name, :last_name, :profile_photo
      )
    end
    devise_parameter_sanitizer.for(:account_update) do |user|
      user.permit(
        :username, :email, :password, :password_confirmation, :location, :age,
        :first_name, :last_name, :profile_photo, :current_password
      )
    end
  end

  protect_from_forgery with: :exception
end
