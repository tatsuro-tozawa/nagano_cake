class Admins::ProductsController < ApplicationController

  before_action :authenticate_admin!

  def new
  	@product = Product.new
  	@genres = Genre.all
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
    @admin_id != current_admin
  	@genres = Genre.all
  end

  def update
  	@product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admins_products_path

  end

  private
  def product_params
  	params.require(:product).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
  end

end
