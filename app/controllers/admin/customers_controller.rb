class Admin::CustomersController < ApplicationController

  # before_action :authenticate_admin

  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
  end

  def update
  end
  
  private
  
  def admin_customer_params
    params.require(:admin_customer).permit()
  end

end
