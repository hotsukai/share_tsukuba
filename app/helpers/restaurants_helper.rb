# frozen_string_literal: true

module RestaurantsHelper
  def restaurant_params
    params.require(:restaurant).permit(:id, :name, :zip, :address, :tel)
  end
end
