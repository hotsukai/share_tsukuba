# frozen_string_literal: true

class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
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
