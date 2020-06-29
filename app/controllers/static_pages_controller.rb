# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @folder = current_user.folders.build if logged_in?
      @feed_items = current_user.feed.page(params[:page])
    end
  end

  def go
    spot = Spot.all
    @recommend = spot.sample
  end

  def start
    if logged_in?
    redirect_to home_path
  end
end
end
