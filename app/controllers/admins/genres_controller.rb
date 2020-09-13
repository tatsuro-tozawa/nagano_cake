class Admins::GenresController < ApplicationController

  def new
  	@genre = Genre.new
  	@genres = Genre.all
  end

  def create
  	@genre = Genre.new(genre_params)
  	@genre.save
  	redirect_to new_admins_genre_path
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
  	@genre = Genre.find(params[:id])
  	@genre.update(genre_params)
  	redirect_to new_admins_genre_path(@genre)
  end

  private
  def genre_params
  	params.require(:genre).permit(:name, :is_active)
  end

end
