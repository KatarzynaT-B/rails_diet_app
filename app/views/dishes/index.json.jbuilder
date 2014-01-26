json.array!(@dishes) do |dish|
  json.extract! dish, :id, :dish_name, :steps, :dish_protein, :dish_fat, :dish_carbs, :dish_calories, :ingredient_id
  json.url dish_url(dish, format: :json)
end
