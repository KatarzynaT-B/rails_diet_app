class Profile < ActiveRecord::Base
  validates_presence_of :name, :age, :sex, :weight, :height, :activity_level
end
