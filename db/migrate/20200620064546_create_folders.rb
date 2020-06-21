# frozen_string_literal: true

class CreateFolders < ActiveRecord::Migration[6.0]
  def change
    create_table :folders do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
    add_index :folders, %i[user_id created_at]
  end
end
