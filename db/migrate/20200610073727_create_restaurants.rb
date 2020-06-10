class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :zip
      t.string :address
      t.string :tel

      t.timestamps
    end
  end
end
