class Public::CartProductsController < ApplicationController

  def index
    @cart_products = current_customer.cart_products
    @total_price = 0
    # @cart_product.each do |cart_product|
    #   tal = cart_product.product.price * cart_item.amount
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
#     @cart_product = CartItem.new(cart_item_params)
#     @cart_product.end_user_id = current_end_user.id
#     #@cart_product.product_id = params[:id]
#     @cart_product.save
#     redirect_to cart_products_path
#   end

  private

  def cart_product_params
    params.require(:cart_product).permit(:quantity)
  end

end
