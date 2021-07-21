class Admin::OrdersController < ApplicationController

  # before_action :authenticate_admin


  def index
    @orders = Order.page(params[:page]).per(5)
    @order_day = @customer.created_order
    @product = Product.find(params[:product_id])
  end

  def show
    @customer = Customer.find(params[:customer_id])
    @order_day = @customer.created_order
    @delivery_address = DelivertAddress.find(params[:delivery_address_id])
    @product = Product.find(params[:product_id])
    @ordered_product = OrderProduct.find(params[:ordered_product_id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to request.referer
  end


  private

  def order_params
    params.require(:order.permit(:order_status))
  end

end
