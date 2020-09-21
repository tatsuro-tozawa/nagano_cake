class Clients::MypageController < ApplicationController

  before_action :authenticate_client!

  def show
  end

  def edit
  	@client = current_client
  end

  def update
  	@client = current_client
  	  if @client.update(client_params)
  	   redirect_to clients_mypage_show_path(@client), success: 'お客様情報が更新されました!'
  	  else
  		flash[:danger] = 'お客様の情報を更新できませんでした。空欄の箇所はありませんか?'
  		render :edit
  	  end
  end

  def withdraw
  	@client = current_client
  end

  def withdraw_status
  	@client = current_client
  	@client.update(is_deleted: true)
  	reset_session
  	redirect_to root_path, info: 'ありがとうございました。またのご利用を心よりお待ちしております。'
  end

  private

  def client_params
  	params.require(:client).permit(:is_deleted, :last_name, :last_name_kana, :first_name, :first_name_kana, :postcode, :address, :telephone_number, :email)
  end

end
