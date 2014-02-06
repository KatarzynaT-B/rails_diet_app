module MenusHelper
  def update_menu_with_values(menu, dishes)
    calories, protein, fat, carbs, meals_no = 0, 0, 0, 0, 0
    menu.meals.each do |meal|
      calories += dishes.find(meal.dish_id).dish_calories
      protein += dishes.find(meal.dish_id).dish_protein
      fat += dishes.find(meal.dish_id).dish_fat
      carbs += dishes.find(meal.dish_id).dish_carbs
      meals_no +=1
    end
    menu.update(calories: calories)
    menu.update(fat: fat.round(2))
    menu.update(carbs: carbs.round(2))
    menu.update(protein: protein.round(2))
    menu.update(meals_no: meals_no)
  end
end
