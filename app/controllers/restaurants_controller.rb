# frozen_string_literal: true

class RestaurantsController < ApplicationController
  include RestaurantsHelper
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

  def new; end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def destroy; end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path
  end
end
