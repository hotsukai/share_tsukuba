# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def go
    spot = Spot.all
    @recommend = spot.sample
  end
end
