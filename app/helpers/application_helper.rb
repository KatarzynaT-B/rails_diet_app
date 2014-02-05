module ApplicationHelper
  def grams_to_kcal(model_object)

    if model_object.is_a? Product
      protein = model_object.protein.to_f
      fat = model_object.fat.to_f
      carbs = model_object.carbs.to_f
    end

    if model_object.is_a? Profile
      protein = model_object.protein_need.to_f
      fat = model_object.fat_need.to_f
      carbs = model_object.carbs_need.to_f
    end

    protein_kcal = (4 * protein).round(2)
    fat_kcal = (9 * fat).round(2)
    carbs_kcal = (4 * carbs).round(2)

    [protein_kcal, fat_kcal, carbs_kcal]
  end

  def count_ingredient_protein(ingredient, product)
    protein = (product.protein * ingredient.quantity_per_dish) / 100.0
    protein.round(2)
  end

  def count_ingredient_fat(ingredient, product)
    fat = (product.fat * ingredient.quantity_per_dish) / 100.0
    fat.round(2)
  end

  def count_ingredient_carbs(ingredient, product)
    carbs = (product.carbs * ingredient.quantity_per_dish) / 100.0
    carbs.round(2)
  end

  def count_ingredient_calories(ingredient, product)
    protein = count_ingredient_protein(ingredient, product)
    fat = count_ingredient_fat(ingredient, product)
    carbs = count_ingredient_carbs(ingredient, product)
    calories = 4.0 * protein + 9.0 * fat + 4.0 * carbs
    calories.to_i
  end

  def calculate_ingredients_values(dish)
    ingredients = dish.ingredients
    ingredients_collection = {}
    ingredients.each do |ingredient|
      product = Product.find(ingredient.product_id.to_i)
      ingredients_collection[product.name] = {
          amount: ingredient.quantity_per_dish,
          protein: count_ingredient_protein(ingredient, product),
          fat: count_ingredient_fat(ingredient, product),
          carbs: count_ingredient_carbs(ingredient, product),
          calories: count_ingredient_calories(ingredient, product)
      }
    end
    ingredients_collection
  end

  def calculate_dish_values(ingredients, dish)
    dish_protein = 0
    dish_fat = 0
    dish_carbs = 0
    dish_calories = 0
    ingredients.each_value do |ingredient_values|
      dish_protein += ingredient_values[:protein].round
      dish_fat += ingredient_values[:fat]
      dish_carbs += ingredient_values[:carbs]
      dish_calories += ingredient_values[:calories]
    end
    dish.update(dish_protein: dish_protein.round(2))
    dish.update(dish_fat: dish_fat.round(2))
    dish.update(dish_carbs: dish_carbs.round(2))
    dish.update(dish_calories: dish_calories)
  end
end

