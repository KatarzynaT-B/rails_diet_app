class RenameActibityLevelToProfile < ActiveRecord::Migration
  def change
    rename_column :profiles, :actibity_level, :activity_level
  end
end
