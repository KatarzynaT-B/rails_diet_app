module MenusHelper
  def collect_meal_information(menu)
    meals = menu.meals
    meals_collection = {}
    meals.each do |meal|
      dish_type = DishType.find(meal.dish_type_id)
      dish = menu.dishes.find(meal.dish_id)
      dish_ingredients = calculate_ingredients_values(dish)
      dish_values = {calories: dish.dish_calories, protein: dish.dish_protein, fat: dish.dish_fat, carbs: dish.dish_carbs}
      meals_collection[meal.id] = {
          type: dish_type.name,
          name: dish.dish_name,
          ingredients: dish_ingredients,
          steps: dish.steps,
          values: dish_values
      }
    end
    meals_collection
  end

  def calculate_menu_values(meals_collection)
    protein, fat, carbs, calories = 0, 0, 0, 0
    meals_collection.each_value do |meal_hash|
      protein += meal_hash[:values][:protein]
      fat += meal_hash[:values][:fat]
      carbs += meal_hash[:values][:carbs]
      calories += meal_hash[:values][:calories]
    end
    {protein: protein.round(2), fat: fat.round(2), carbs: carbs.round(2), calories: calories}
  end
end
