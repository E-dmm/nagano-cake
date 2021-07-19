class Admin::CustomersController < ApplicationController

  # before_action :authenticate_admin

  def index
    # @customers = Customer.all kaminari使用の為
    @customers = Customer.page(params[:page]).reverse_order
  end

  def show
    @customer = Customer.find(params[:id])
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
