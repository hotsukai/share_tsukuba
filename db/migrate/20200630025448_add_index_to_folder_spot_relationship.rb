# frozen_string_literal: true

class AddIndexToFolderSpotRelationship < ActiveRecord::Migration[6.0]
  def change
    add_index :folder_spot_relationships, %i[spot_id folder_id], unique: true
  end
end
