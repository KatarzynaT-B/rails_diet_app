class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :product_id
      t.integer :dish_id
      t.float :quantity_per_dish

      t.timestamps
    end
  end
end
