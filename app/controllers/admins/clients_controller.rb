class Admins::ClientsController < ApplicationController

  before_action :authenticate_admin!

  def edit
  	@client = Client.find(params[:id])
  end

  def update
  	@client = Client.find(params[:id])
  	if @client.update(client_params)
  		redirect_to admins_client_path
  	else
  		render :edit
  	end
  end

  def index
  	@clients = Client.all
  end

  def show
  	@client = Client.find(params[:id])
  end

  private

  def client_params
  	params.require(:client).permit(:id, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :telephone_number, :is_deleted)
  end

end
