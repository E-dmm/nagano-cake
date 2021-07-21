class Public::ProductsController < ApplicationController

  def index
     @products = Product.page(params[:page]).reverse_order
     @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])

    @cart_product = CartProduct.new

    @genres = Genre.all

  end

end
