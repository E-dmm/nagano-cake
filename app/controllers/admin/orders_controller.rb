class Admin::OrdersController < ApplicationController

  # before_action :authenticate_admin

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @product = Product.find(params[:id])
    @ordered_product = OrderedProduct.find(params[:id])
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
