class Meal < ActiveRecord::Base
  belongs_to :dish
  belongs_to :menu
  belongs_to :dish_type

  default_scope {order(:position)}
end
