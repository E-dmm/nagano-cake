class Admin::OrdersController < ApplicationController

  # before_action :authenticate_admin

  def index
    @orders = Order.page(params[:page]).reverse_order
  end

  def show
  end

  def update
  end

end
