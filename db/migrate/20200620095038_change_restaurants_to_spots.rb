# frozen_string_literal: true

class ChangeRestaurantsToSpots < ActiveRecord::Migration[6.0]
  def change
    rename_table :restaurants, :spots
  end
end
