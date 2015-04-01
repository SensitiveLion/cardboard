class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

   protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) { |user| user.permit(:username,
       :email, :password, :password_confirmation, :location, :age, :first_name,
       :last_name, :profile_photo) }
   end

  protect_from_forgery with: :exception
end
