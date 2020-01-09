class SpotsController < ApplicationController
  def index
    @spots = Spot.order('id ASC').limit(3)
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def search
    @spots = []
  end
end
