class Ingredient < ActiveRecord::Base
  belongs_to :dish
  belongs_to :product
  validates_numericality_of :quantity_per_dish, message: "Nieprawidłowo podana ilość składnika"
  validates_presence_of :quantity_per_dish, message: "Podaj ilość każdego ze składników"
  validates_presence_of :product_id, message: "Wybierz składniki z listy"
end
