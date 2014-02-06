class Dish < ActiveRecord::Base
  validates_presence_of :dish_name, message: "Podaj nazwę dania"
  validates_uniqueness_of :dish_name, message: "Danie o takiej nazwie już istnieje"

  has_many :ingredients, dependent: :destroy
  has_many :menus, through: :meals
  has_many :dish_types, through: :meals
  has_many :meals

  accepts_nested_attributes_for :ingredients,
                                allow_destroy: true
end
