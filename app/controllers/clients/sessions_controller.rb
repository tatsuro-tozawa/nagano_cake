# frozen_string_literal: true

class Clients::SessionsController < Devise::SessionsController

  before_action :reject_client, only: [:create]

  protected

  def reject_client
    @client = Client.find_by(email: params[:client][:email].downcase)
    if @client
      if (@client.valid_password?(params[:client][:password]) && (@client.active_for_authentication? == false))
        flash[:danger] = "退会済みです。"
        redirect_to new_client_session_path
      end
    else
      flash[:danger] = "必須項目を入力してください。"
    end
  end

  def after_sign_in_path_for(resouse)
    clients_client_top_path
  end

  def after_sign_out_path_for(resouse)
    client_session_path
  end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
