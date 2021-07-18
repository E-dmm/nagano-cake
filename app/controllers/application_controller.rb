class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_orders_path
    when Customer
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when Admin
      admin_sign_in_path
    when Customer
      root_path
    end
  end

end
