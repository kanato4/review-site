class UsersController < ApplicationController
  def index
    @review = Review.where(user_id: current_user.id)
  end
end