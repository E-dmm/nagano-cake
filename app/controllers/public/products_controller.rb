class Public::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).reverse_order
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
end
