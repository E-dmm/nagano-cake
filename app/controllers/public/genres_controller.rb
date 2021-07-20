class Public::GenresController < ApplicationController

  def index
    @genre = Genre.find(params[:id])
    @products = Product.where(genre_id: @genre.id).page(params[:page]).per(8)
    @genres = Genre.all
  end

end
