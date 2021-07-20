class Admin::CustomersController < ApplicationController

  # before_action :authenticate_admin

  def index
    @customers = Customer.page(params[:page]).per(5).order(id:"ASC")
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
     @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email, :is_delete)
  end

end
