class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :calories
      t.float :protein
      t.float :fat
      t.float :carbs
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
