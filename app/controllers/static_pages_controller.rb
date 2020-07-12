# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @folder = current_user.folders.build if logged_in?
      @new_feed_items = Folder.page(params[:page]).per(5)
      @timeline_items = current_user.feed.page(params[:page]).per(5)
    end
  end

  def go
    spot = Spot.all
    @recommend = spot.sample
  end

  def start
    redirect_to home_path if logged_in?
end
end
