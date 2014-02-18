class AddPositionColumnToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :position, :integer
  end
end
