class ApplicationController < ActionController::Base
  

   before_action :configure_permitted_parameters, if: :devise_controller?

  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(image))
  end
  
   
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i(image))
  end
  
 

  
end
