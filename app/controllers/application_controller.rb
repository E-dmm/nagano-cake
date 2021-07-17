class ApplicationController < ActionController::Base

  # current_user.admin?
  # before_action :authenticate_admin!,except: [:top]
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    admin_orders_path
  end

  def after_sign_out_path_for(resource)
    admins_sign_in_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys[:email])
  end

end
