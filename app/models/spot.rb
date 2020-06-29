# frozen_string_literal: true

class Spot < ApplicationRecord
  has_many :saved_relationships, class_name: 'FolderSpotRelationship', foreign_key: :spot_id, dependent: :destroy
  has_many :folders, through: :saved_relationships, source: :folder

  has_one_attached :image

  validates :name, presence: true, length: { maximum: 50 }
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: 'must be a valid image format' },
                    size: { less_than: 5.megabytes,
                            message: 'should be less than 5MB' }

  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
