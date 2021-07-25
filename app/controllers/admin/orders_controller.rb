class Admin::OrdersController < ApplicationController


  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
    @product = Product.find(params[:id])
    @ordered_products = @order.ordered_products
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if  @order.order_status == "入金確認"
      @order.ordered_products.update(production_status:"製作待ち")
    end
    redirect_to request.referer
  end


  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
