class SpotsController < ApplicationController
  def index
    @spots = Spot.order('id ASC').limit(4)
  end
end
