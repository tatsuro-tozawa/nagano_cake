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
  		flash[:danger] = '入力内容をご確認ください。'
  		render :new
  	end
  end

  def edit
  	@address = Address.find(params[:id])
  	if @address.client != current_client
  		redirect_back(fallback_location: root_path)
  		flash[:danger] = 'お探しのページにアクセスできません。'
  	end
  end

  def update
  	@address = Address.find(params[:id])
  	if @address.update(address_params)
  		flash[:success] = '住所情報を更新しました!'
  		redirect_to new_clients_address_path
  	else
  		flash[:danger] = '入力内容をご確認ください。'
  		render :edit
  	end
  end

  def destroy
  	@address = Address.find(params[:id])
  	@address.destroy
  	flash[:info] = '登録した住所を削除しました。'
  	redirect_to new_clients_address_path
  end

  private

  def set_client
  	@client = current_client
  end

  def address_params
  	params.require(:address).permit(:address, :postcode, :name)
  end

end
