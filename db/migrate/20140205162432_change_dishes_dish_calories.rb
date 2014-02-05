class ChangeDishesDishCalories < ActiveRecord::Migration
  def change
    change_column :dishes, :dish_calories, :float
  end
end
