class Admin::ProductsController < ApplicationController

  # before_action :authenticate_admin

  def index
    @products = Product.page(params[:page]).order(created_at: :asc)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product)
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :genre_id, :is_active, :image, :text)
  end

end
