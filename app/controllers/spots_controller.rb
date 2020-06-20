# frozen_string_literal: true

class SpotsController < ApplicationController
  include SpotsHelper
  def index
    @spots = Spot.page(params[:page]).per(30)
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def create
    spot = Spot.new(spot_params)
    spot.save
    redirect_to root_path
  end

  def new; end

  def edit
    @spot = Spot.find(params[:id])
  end

  def destroy; end

  def update
    @spot = Spot.find(params[:id])
    @spot.update(spot_params)
    redirect_to @spot
  end
end
