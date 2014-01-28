class Dish < ActiveRecord::Base
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients,
                                allow_destroy: true
                                #reject_if: lambda { |a| a.product_id.blank? }
end
