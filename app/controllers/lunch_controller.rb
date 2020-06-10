# frozen_string_literal: true

class LunchController < ApplicationController
  def go
    restaurant = Restaurant.all
    @recommend = restaurant.sample
  end

  def new; end
end
