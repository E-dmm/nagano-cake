class Admin::OrdersController < ApplicationController

  # before_action :authenticate_admin

  def index
    @orders = Order.page(params[:page]).per(5)
    # @order_day = @orders.created_at.strftime('%Y/%m/%d')
    # @customer = current_customer
  end

  def show
    @customer = current_customer
    @order = Order.find(params[:id])
    @order_day = @order.created_at.strftime('%Y/%m/%d')
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
