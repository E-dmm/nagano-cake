class Public::CartProductsController < ApplicationController

   before_action :authenticate_customer!

  def create
    @cart_product = CartProduct.new(cart_product_params)
    if !@cart_product.quantity.present?
      redirect_to request.referer
    else
    @cart_product.customer_id = current_customer.id
    @cart_product.save
    redirect_to cart_products_path
    end
  end

  def index
    @cart_products = current_customer.cart_products
    @total_price = 0
    @cart_products.each do |cart_product|
      total = cart_product.product.price * cart_product.quantity
      tax = 1.1
      @total_price += total * tax
      @total_price = @total_price.floor
    end
  end

  def update
    cart_product = CartProduct.find(params[:id])
    cart_product.update(cart_product_params)
    redirect_to cart_products_path
  end

  def destroy
    cart_product = CartProduct.find(params[:id])
    cart_product.destroy
    redirect_to cart_products_path
  end

  def all_destroy
    CartProduct.destroy_all
    redirect_to root_path
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:product_id, :quantity)
  end

end
