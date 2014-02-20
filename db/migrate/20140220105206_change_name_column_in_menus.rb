class ChangeNameColumnInMenus < ActiveRecord::Migration
  def change
    rename_column :menus, :name, :menu_date
  end
end
