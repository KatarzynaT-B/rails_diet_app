class ChangeMenuDateTypeColumnInMenus < ActiveRecord::Migration
  def change
    change_column :menus, :menu_date, :date
  end
end
