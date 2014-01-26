class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :sex
      t.integer :age
      t.integer :weight
      t.integer :height
      t.integer :actibity_level
      t.float :calories_need
      t.float :protein_need
      t.float :fat_need
      t.float :carbs_need

      t.timestamps
    end
  end
end
