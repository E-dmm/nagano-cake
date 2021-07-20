class Public::CartProductsController < ApplicationController

  def index
    @cart_products = current_customer.cart_products
    @total_price = 0
    # @cart_product.each do |cart_item|
    #   tal = cart_item.item.non_taxed_price * cart_item.amount
    # @total += tal
    # end
  end

  def update
    cart_product = CartProduct.find(params[:id])
    cart_product.update(cart_product_params)
    redirect_to cart_products_path
  end

  def destroy
    cart_product = CartProduct.find(params[:id])
    cart_product.destroy
    redirect_to root_path
  end

  def destroy_all
    CartProduct.destroy_all
    flash[:notice] = "全部消しただなも"
    redirect_to root_path
  end

#   def create
#     @cart_item = CartItem.new(cart_item_params)
#     @cart_item.end_user_id = current_end_user.id
#     #@cart_item.item_id = params[:id]
#     @cart_item.save
#     redirect_to cart_items_path
#   end

  private

  def cart_product_params
    params.require(:cart_product).permit(:quantity)
  end

end
