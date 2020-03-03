class UsersController < ApplicationController
  def index
    @review = Review.where(user_id: current_user.id).order("created_at DESC").page(params[:page]).per(5)
  end
end