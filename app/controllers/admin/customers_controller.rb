class Admin::CustomersController < ApplicationController

  # before_action :authenticate_admin

  def index
    @customers = Customer.page(params[:page]).per(5).order(created_at: :asc)
  end

  def show
    @customer = current_customer
  end

  def edit
     @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to admin_customer_path(current_customer)
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email, :is_delete)
  end

end
