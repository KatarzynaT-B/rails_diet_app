class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.integer :meals_no
      t.integer :calories
      t.float :protein
      t.float :fat
      t.float :carbs

      t.timestamps
    end
  end
end
