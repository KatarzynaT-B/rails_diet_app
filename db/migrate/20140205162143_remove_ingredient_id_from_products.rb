class RemoveIngredientIdFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :ingredient_id, :integer
  end
end
