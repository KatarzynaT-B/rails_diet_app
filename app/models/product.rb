class Product < ActiveRecord::Base
  validates_presence_of :name, message: "Podaj nazwę produktu"
  validates_uniqueness_of :name, message: "Produkt o takiej nazwie już istnieje"
  validates_presence_of :protein, message: "Podaj ilość białka"
  validates_numericality_of :protein, message: "Ilość białka podana niepoprawnie"
  validates_presence_of :fat, message: "Podaj ilość tłuszczu"
  validates_numericality_of :fat, message: "Ilość tłuszczu podana niepoprawnie"
  validates_presence_of :carbs, message: "Podaj ilość węglowodanów"
  validates_numericality_of :carbs, message: "Ilość węglowodanów podana niepoprawnie"
  has_many :ingredients, dependent: :destroy
end
