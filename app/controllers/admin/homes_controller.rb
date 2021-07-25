class Admin::HomesController < ApplicationController

  def top
    # @orders = Order.page(params[:page]).reverse_order
    @orders = Order.all.page(params[:page]).per(5)
  end

end
