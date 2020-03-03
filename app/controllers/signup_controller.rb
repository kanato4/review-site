class SignupController < ApplicationController
  include RandomValue
  require 'twilio-ruby'

  before_action :save_user_info_to_session, only: :user_tel
  before_action :save_user_tel_to_session, only: :user_tel_verification
  before_action :send_sms_code, only: :user_tel_verification
  before_action :check_sms_code, only: :create

  def user_info
    @user = User.new
  end

  def save_user_info_to_session
    session[:user_params] = user_params
    @user = User.new(session[:user_params])
    render action: "user_info" unless @user.valid?
  end 

  def user_tel
    @user = User.new
  end

  def save_user_tel_to_session
    session[:user_params_after_user_tel] = user_params
    session[:user_params].merge!(session[:user_params_after_user_tel])
    @user = User.new(session[:user_params])
    render action: "user_tel" unless @user.valid?
  end

  def send_sms_code
    if session[:user_params_after_user_tel][:telephone].present?
      @user = User.new
      send_phone_number = PhonyRails.normalize_number session[:user_params_after_user_tel][:telephone], country_code:'JP'
      session[:secure_code] = random_number_generator(4)
      begin
        client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
        result = client.messages.create(
          from: ENV["TWILIO_PHONE_NUMBER"],
          to:   send_phone_number,
          body: "認証番号：#{session[:secure_code]}"
        )
      rescue Twilio::REST::RestError => e
        @messages = "エラーコード[#{e.code}] ：”#{e.message}”"
        render action: "user_tel"
      end
    end
  end

  def user_tel_verification
    @user = User.new
  end

  def check_sms_code
    if session[:user_params_after_user_tel][:telephone].present?
      session[:input_code] = user_params[:user_address_attributes]
      @user = User.new
      redirect_to action: :user_tel_verification unless session[:input_code].present?
      render action: "user_tel_verification" and return unless session[:secure_code] == session[:input_code][:telephone]
    end
  end

  def create
    @user = User.new(session[:user_params])
    if @user.save
      sign_in User.find(@user.id)
      redirect_to user_complete_signup_index_path
    else
      render user_info_signup_index_path
    end
  end

  def user_complete
    session[:user_params].clear
    session[:secure_code].clear if session[:secure_code].present?
    session[:input_code].clear if session[:input_code].present?
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation, 
      :telephone,
      :birthday, 
      :gender
    )
  end
end
