class Menu < ActiveRecord::Base
  has_many :dishes, through: :meals
  has_many :dish_types, through: :meals
  has_many :meals, dependent: :destroy

  accepts_nested_attributes_for :meals,
                                allow_destroy: true
end
