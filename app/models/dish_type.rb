class DishType < ActiveRecord::Base
  has_many :menus, through: :meals
  has_many :dishes, through: :meals
  has_many :meals

  validates_presence_of :name
end
