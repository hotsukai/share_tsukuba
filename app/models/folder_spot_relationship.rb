# frozen_string_literal: true

class FolderSpotRelationship < ApplicationRecord
  belongs_to :spot, class_name: 'Spot'
  belongs_to :folder, class_name: 'Folder'

  validates :spot_id, presence: true
  validates :folder_id, presence: true
end
