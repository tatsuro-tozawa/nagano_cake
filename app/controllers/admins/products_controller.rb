class Admins::ProductsController < ApplicationController

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	@product.save
  	redirect_to admins_products_path
  end

  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])
  	@product.update(product_params)
  	redirect_to admins_products_path(@product)
  end

  private
  def product_params
  	params.require(:product).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
  end

end
