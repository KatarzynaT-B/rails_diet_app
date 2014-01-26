class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :dish_name
      t.text :steps
      t.float :dish_protein
      t.float :dish_fat
      t.float :dish_carbs
      t.float :dish_calories
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
