class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?
  
  def affter_sign_in_path_for(resorce)
    root_path
  end
  
  def affter_sign_out_path_for(resorce)
    root_path
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :introduction, :gender, :age])
  end
end
