class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :dish_type_id
      t.integer :dish_id
      t.integer :menu_id

      t.timestamps
    end
  end
end
