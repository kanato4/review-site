class ReviewsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_review, only: [:show, :edit, :update]

  def index
    @review = Review.all.recent(9)
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

  def edit
    redirect_to review_path unless current_user.id == @review.user_id
  end

  def update
    if @review.user_id == current_user.id
      @review.update(review_params)
      redirect_to review_path(@review)
    end
  end

  def show
    @user = User.find(@review.user_id)
    @lat = @review.spot.latitude
    @lng = @review.spot.longitude
    gon.lat = @lat
    gon.lng = @lng
  end

  def search
    @tags = Review.tagged_with([params[:search_tag]]).order("created_at DESC").page(params[:page]).per(5)
  end
  
  def destroy
    @review = Review.find(params[:id])
    if @review.user_id == current_user.id
      @review.destroy 
      redirect_to users_path
    end
  end

  private

  def review_params
      params.require(:review).permit(
        :title,
        :rating,
        :description,
        :status,
        :tag_list,
        images_attributes: [:image],
        spot_attributes: [:address]
      ).merge(user_id: current_user.id)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
