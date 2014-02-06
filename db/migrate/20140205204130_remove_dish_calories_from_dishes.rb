class RemoveDishCaloriesFromDishes < ActiveRecord::Migration
  def change
    remove_column :dishes, :dish_calories, :float
  end
end
