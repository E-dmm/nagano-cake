class Public::SearchesController < ApplicationController
  def search
    @q = Customer.ransack(params[:q])
    @customers = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
  end
end
