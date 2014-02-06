class AddDishCaloriesColumnToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :dish_calories, :integer
  end
end
