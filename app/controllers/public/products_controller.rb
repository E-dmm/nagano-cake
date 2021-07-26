class Public::ProductsController < ApplicationController

  def index
     @products = Product.page(params[:page]).reverse_order
     @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @genres = Genre.all
    @cart_product = CartProduct.new
  end
  
  
end
