class Admins::ClientsController < ApplicationController

  before_action :authenticate_admin!

  def edit
  end

  def update
  end

  def index
  	@clients = Client.all
  end

  def show
  	@client = Client.find(params[:id])
  end

  private

  def client_params
  	params.require(:client).permit(:id, :email, :last_name, :first_name, :is_active)
  end

end
