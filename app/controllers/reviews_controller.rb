class ReviewsController < ApplicationController

  before_action :authenticate_user!, only: [:new]
  before_action :set_review, only: [:show]

  def index
    @tags = Review.tag_counts_on(:tags).order('count DESC')
  end

  def new
    @review = Review.new
    3.times { @review.images.build }
    @review.build_spot
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path
    else
      redirect_to new_review_path
    end
  end

  def show
    @user = User.find(@review.user_id)
    @lat = @review.spot.latitude
    @lng = @review.spot.longitude
    gon.lat = @lat
    gon.lng = @lng
  end
  
  private

  def review_params
      params.require(:review).permit(
        :title,
        :rating,
        :description,
        :tag_list,
        images_attributes: [:image],
        spot_attributes: [:address]
      ).merge(user_id: current_user.id)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
