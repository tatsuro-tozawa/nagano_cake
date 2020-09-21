class Clients::AddressesController < ApplicationController

	before_action :authenticate_client!
	before_action :set_client

  def new
  	@address = Address.new
  	@addresses = @client.addresses
  end

  def create
  	@address = @client.addresses.build(address_params)
  	if @address.save
  		flash[:success] = '新しい住所を登録しました!'
  		redirect_to new_clients_address_path
  	else
  		@addreses = @client.addresses
  		flash[:danger] = '入力内容をご確認くださいませ。'
  		render :new
  	end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_client
  	@client = current_client
  end

  def address_params
  	params.require(:address).permit(:address, :postcode, :name)
  end

end
