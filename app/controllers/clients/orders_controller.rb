class Clients::OrdersController < ApplicationController

  before_action :authenticate_client!
  before_action :set_client

  def index
  	@orders = @client.orders
  end

  def create
  	if current_client.cart_details.exists?
  		@order = Order.new(order_params)
  		@order.client = current_client

  		@add = params[:order][:add].to_i
  		case @add
  		when 1
  			@order.postcode = @client.postcode
  			@order.name = @client.name
  			@order.address = full_name(@client)
  		when 2
  			@order.postcode = params[:order][:postcode]
  			@order.name = params[:order][:name]
  			@order.address = params[:order][:address]
  		when 3
  			@order.postcode = params[:order][:postcode]
  			@order.name = params[:order][:name]
  			@order.address = params[:order][:address]
  	end
  	@order.save

  	if Address.find_by(address: @order.name).nil?
  		@address = Address.new
  		@address.postcode = @order.postcode
  		@address.name = @order.name
  		@address.address = @order.address
  		@address.client = current_client
  		@address.save
  	end

  	current_client.cart_products.each do |cart_product|
  		order_detail = @order.order_details
  		order_detail.order_id = @order.id
  		order_detail.product_id = cart_product.product_id
  		order_detail.quantity = cart_product.quantity
  		order_detail.price = cart_product.product.price
  		order_detail.save
  		order_detail.destroy
  	end
  	render :thanks

  	else
  		redirect_to clients_client_top_path
  		flash[:danger] = 'カートが空です'
  	end
  end

  def new
  	@order = Order.new
  end

  def show
  end

  def confirm
  	@order = Order.new
  	@cart_products = current_client.cart_products
  	@order.payment_method = params[:order][:payment_method]
  	@add = params[:order][:add].to_i
  	case @add
  	when 1
  		@order.postcode = @client.postcode
  		@order.address = @client.address
  		@order.name = @client.last_name + @client.first_name
  	when 2
  		@sta = params[:order][:address].to_i
  		@address = Address.find(@sta)
  		@order.postcode = @address.postcode
  		@order.address = @address.address
  		@order.name = @address.name
  	when 3
  		@order.postcode = params[:order][:new_add][:postcode]
  		@order.address = params[:order][:new_add][:address]
  		@order.name = params[:order][:new_add][:name]
  	end
  end

  def thanks
  end

  private

  def set_client
  	@client = current_client
  end

  def order_params
  	params.require(:order).permit(:created_at, :client_id, :address, :postcode, :name, :payment_method, :total_payment, :postage, :status, order_details_attributes: [:order_id, :product_id, :price, :quantity, :production_status])
  end
end
