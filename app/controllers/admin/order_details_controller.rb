class Admin::OrderDetailsController < ApplicationController

  def update
    @order_product = OrderedProduct.find(params[:id])
    @order_product.update(ordered_product_params)
    redirect_to request.referer
  end
  
  
  private
  
  def ordered_product_params
    params.require(:ordered_product).permit(:production_status)
  end


end
