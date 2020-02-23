class ReviewsController < ApplicationController

  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @review = Review.new
    3.times { @review.images.build }
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path
    else
      redirect_to new_review_path
    end
  end
  
  private

  def review_params
      params.require(:review).permit(
        :title,
        :rating,
        :description,
        images_attributes: [:image]
      ).merge(user_id: current_user.id)
  end
end
