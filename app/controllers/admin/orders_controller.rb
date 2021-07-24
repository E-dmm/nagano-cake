class Admin::OrdersController < ApplicationController

  # before_action :authenticate_admin

  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
    @product = Product.find(params[:id])
    @ordered_products = @order.ordered_products
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to request.referer
  end


  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
