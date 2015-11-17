class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def require_sign_in
    unless current_user
    flash[:error] = "You must be logged in to do that!"
    redirect_to(new_user_session_path)
    end
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name]
    devise_parameter_sanitizer.for(:account_update) << [:name]
  end
  
  # def after_sign_in_path_for(resource)
  #   user_path(current_user)
  # end
end
