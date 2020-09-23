class Clients::GenresController < ApplicationController
  def index
  end

  def show
  	@genre = Genre.find(params[:id])
  	@genres = Genre.where(is_active: true)
  end

  private
  def genre_params
  	params.require(:genre).permit(:name, :id)
  end

end
