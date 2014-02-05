class Profile < ActiveRecord::Base
  validates_presence_of :name, message: "Podaj nazwę profilu"
  validates_presence_of :age, message: "Podaj wiek"
  validates_presence_of :sex, message: "Wybierz płeć"
  validates_presence_of :weight, message: "Podaj wagę"
  validates_presence_of :height, message: "Podaj wzrost"
  validates_presence_of :activity_level, message: "Wybier poziom aktywności"
  validates_numericality_of :age, message: "Wiek musi być zapisany cyframi"
  validates_numericality_of :weight, message: "Waga musi być zapisana cyframi"
  validates_numericality_of :height, message: "Wzrost musi być zapisany cyframi"
end
