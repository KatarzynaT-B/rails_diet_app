class Article < ActiveRecord::Base
  validates_presence_of :title, message: "Podaj tytuł artykułu"
  validates_presence_of :author, message: "Podaj autora artykułu"
  validates_presence_of :content, message: "Podaj treść artykułu"
end
