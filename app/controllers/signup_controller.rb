class SignupController < ApplicationController
  before_action :save_user_info_to_session, only: :user_tel
  before_action :save_user_tel_to_session, only: :user_tel_verification

  def user_info
    @user = User.new
    @user.build_position
    @user.build_gender
  end

  def save_user_info_to_session
    session[:user_params] = user_params
    session[:position_attributes] = user_params[:position_attributes]
    session[:gender_attributes] = user_params[:gender_attributes]
    @user = User.new(session[:user_params])
    @user.build_position(session[:position_attributes])
    @user.build_gender(session[:gender_attributes])
    render '/signup/user_info' unless @user.valid?
  end 

  def user_tel
    @user = User.new
    @user.build_position
    @user.build_gender
  end

  def save_user_tel_to_session
    session[:user_params_after_user_tel] = user_params[:telephone]
    session[:user_params].merge!(session[:user_params_after_user_tel])
    @user = User.new(session[:user_params])
    @user.build_position
    @user.build_gender
    render '/signup/user_tel' unless @user.valid?
  end

  def user_tel_verification
    @user = User.new
    @user.build_position
    @user.build_gender
  end

  def create
    @user = User.new(session[:user_params])
    @user.build_position(session[:position_attributes])
    @user.build_gender(session[:gender_attributes])
    if @user.save(context: :user_signup)
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
    session[:position_attributes].clear
    session[:gender_attributes].clear
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
      :gender,
      position_attributes: [:id, :position]
      gender_attributes: [:id, :gender]
    )
  end
end
