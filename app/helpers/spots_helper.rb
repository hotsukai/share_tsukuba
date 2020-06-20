# frozen_string_literal: true

module SpotsHelper
  def spot_params
    params.require(:spot).permit(:id, :name, :zip, :address, :tel)
  end
end
