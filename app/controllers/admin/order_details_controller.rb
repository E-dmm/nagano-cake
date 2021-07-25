class Admin::OrderDetailsController < ApplicationController

  def update
    @ordered_product = OrderedProduct.find(params[:id])
    @ordered_product.update(ordered_product_params)
      if @ordered_product.production_status == "製作中"
        @ordered_product.order.update(order_status:"製作中")
      elsif @ordered_product.production_status == "製作完了"
        @ordered_product.order.update(order_status:"発送準備中")
      else
        redirect_to request.referer
      end
    redirect_to request.referer
  end


  private

  def ordered_product_params
    params.require(:ordered_product).permit(:production_status)
  end

end
