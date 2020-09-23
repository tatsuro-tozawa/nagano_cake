class Clients::ProductsController < ApplicationController

  def index
  	@products = Product.all.includes(:genre).where(genres: {is_active: true})
  	@genres = Genre.where(is_active: true)
  end

  def show
  	@product = Product.find(params[:id])
  	@cart = @product.cart_products
  	@genres = Genre.where(is_active: true)
  end

  private
  def product_params
  	params.require(:product).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
  end

end
