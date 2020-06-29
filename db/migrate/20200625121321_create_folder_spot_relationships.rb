# frozen_string_literal: true

class CreateFolderSpotRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :folder_spot_relationships do |t|
      t.integer :folder_id
      t.integer :spot_id
      t.text :comment

      t.timestamps
    end
    add_index :folder_spot_relationships, :folder_id
    add_index :folder_spot_relationships, :spot_id
  end
end
