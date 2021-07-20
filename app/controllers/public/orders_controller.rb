class Public::OrdersController < ApplicationController

  def index
  end

  def show
    @order = Order.find(params[:id])
    @customer = Customer.find(params[:customer_id])
    @order_day = @customer.created_order
    @delivery_address = DelivertAddress.find(params[:delivery_address_id])
  end

end
