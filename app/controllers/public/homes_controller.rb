class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    # 最新から４つ
    @products = Product.limit(3).order(" created_at DESC ")
  end

  def about
  end
end
