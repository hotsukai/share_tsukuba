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
    @spot = Spot.new(spot_params)
    @spot.image.attach(params[:spot][:image])
    if @spot.save
      flash[:success] = 'スポットが登録されました！'
    else
      flash[:error] = 'スポットが登録できませんでした...'
    end
    redirect_to root_path
  end

  def new
  @spot=Spot.new
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def destroy; end

  def update
    @spot = Spot.find(params[:id])
    @spot.image.attach(params[:spot][:image])
    if @spot.update(spot_params)
      flash[:success] = 'スポットを更新しました！'
    else
      flash[:error] = 'スポットを更新できませんでした...'
     end
    redirect_to @spot
  end

  def spot_params
    params.require(:spot).permit(:id, :name, :zip, :address, :tel, :image)
 end
end
