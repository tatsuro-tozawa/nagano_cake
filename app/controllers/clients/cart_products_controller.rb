class Clients::CartProductsController < ApplicationController

  before_action :authenticate_client!
  before_action :set_cart_product, only: [:show, :update, :destroy, :edit]
  before_action :set_client

  def index
  	@cart_products = @client.cart_products.all
  end

  def create
  	@cart_product = current_client.cart_products.build(cart_product_params)
  	@current_product = CartProduct.find_by(product_id: @cart_product.product_id,client_id: @cart_product.client_id)
  	if @current_product.nil?
  		if @cart_product.save
  			flash[:success] = 'カートに商品が追加されました!'
  			redirect_to clients_cart_products_path
  		else
  			@carts_prducts = @client.cart_products.cart_products.all
  			render 'index'
  			flash[:danger] = 'カートに商品を追加できませんでした。'
  		end
  	else
  		@current_product.quantity += params[:quantity].to_i
  		@current_product.update(cart_product_params)
  		redirect_to clients_cart_products_path
  	end
  end

  def destroy
  	@cart_product.destroy
  	redirect_to clients_cart_products_path
  	flash[:info] = 'カート商品を取り消しました。'
  end

  def update
  	if @cart_product.update(cart_product_params)
  		redirect_to clients_cart_products_path
  		flash[:success] = 'カート内の商品を更新しました!'
  	end
  end

  def destroy_all
  	@client.cart_products.destroy_all
  	redirect_to clients_cart_products_path
  	flash[:info] = 'カートを空にしました。'
  end

  private

  def set_client
  	@client = current_client
  end

  def set_cart_product
  	@cart_product = CartProduct.find(params[:id])
  end

  def cart_product_params
  	params.require(:cart_product).permit(:product_id, :client_id, :quantity)
  end

end
