class Public::ProductsController < ApplicationController

  def index
    @genres = Genre.all
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @Genres = Genre.all
  end

end
