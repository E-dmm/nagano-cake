class Public::ProductsController < ApplicationController

  def index
     @products = Product.all.page(params[:page]).reverse_order
     @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @genres = Genre.all
    @cart_product = CartProduct.new
  end
  
  def search
    @results = @q.result.includes(:product)
  end
  
  # def search
  #   #Viewのformで取得したパラメータをモデルに渡す
  #   @product = Product.search(params[:search])
  # end
  
end
