# frozen_string_literal: true

class RestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.all
  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    restaurant.save
    redirect_to root_path
  end

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end
end
