# frozen_string_literal: true

class Restaurant < ApplicationRecord
  validates :name,presence: true,length:{maximum:50}
#   validates :zip
#   validates :address
#   validates :tel
end
