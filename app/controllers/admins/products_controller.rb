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
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def product_params
  	params.require(:product).permit(:genre, :name, :image, :introduction, :price, :is_active)
  end

end
