class Admin::OrderDetailsController < ApplicationController

  def update
    @order_product = find(params[:id])
    @order_product.update(order_product_params)
    redirect_to request.referer
  end
  
  
  private
  
  def order_product_params
    params.require(:order_product.permit(:production_status))
  end


end
