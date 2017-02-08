class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

   protected
  #  need to add name and address key in order to render in browser
   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :first_name, :last_name,])
     devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :first_name, :last_name])
   end
  def  after_sign_in_path_for(resource)
    user_path(resource.id)
  end



end
