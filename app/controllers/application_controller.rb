class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :last_name_kane, :first_name, :first_name_kana, :postcode, :address, :telephone_number, :password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:password])
  end

  def after_sign_in_path_for(resouse)
  	admins_top_path
  end

  def after_sign_in_path_for(resouse)
    clients_client_top_path
  end

  def after_sign_out_path_for(resouse)
  	admin_session_path
  end

  def after_sign_out_path_for(resouse)
    client_session_path
  end

end

