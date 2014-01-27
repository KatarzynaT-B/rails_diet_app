module ProductsHelper

  def count_calories(product)
    calories = product.protein * 4 + product.fat * 9 + product.carbs * 4
    product.update(calories: calories.to_i)
  end
end
