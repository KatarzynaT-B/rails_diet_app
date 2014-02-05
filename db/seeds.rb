profile1 = Profile.create(name: "Pierwszy", sex: 1, age: 25, weight: 55, height: 168, activity_level: 4)
profile1.save
profile2 = Profile.create(name: "Drugi", sex: 1, age: 35, weight: 65, height: 172, activity_level: 5)
profile2.save
profile3 = Profile.create(name: "Trzeci", sex: 2, age: 40, weight: 75, height: 185, activity_level: 3)
profile3.save

Product.create(name: "produkt 1", calories: 600, protein: 50, fat: 30, carbs: 15)
Product.create(name: "produkt 2", calories: 480, protein: 44, fat: 15, carbs: 33)
Product.create(name: "produkt 3", calories: 230, protein: 3.8, fat: 2, carbs: 21)
Product.create(name: "produkt 4", calories: 555, protein: 88.1, fat: 9.5, carbs: 40)
Product.create(name: "produkt 5", calories: 876, protein: 12, fat: 12, carbs: 230.2)
Product.create(name: "produkt 6", calories: 90, protein: 9, fat: 8, carbs: 10)

dish1 = Dish.create(dish_name: "danie 1", steps: "wykonanie")
dish2 = Dish.create(dish_name: "danie 2", steps: "wykonanie")
dish3 = Dish.create(dish_name: "danie 3", steps: "wykonanie")


Ingredient.create(dish_id: dish1.id, product_id: 1, quantity_per_dish: 20)
Ingredient.create(dish_id: dish1.id, product_id: 2, quantity_per_dish: 3)
Ingredient.create(dish_id: dish1.id, product_id: 3, quantity_per_dish: 270)
Ingredient.create(dish_id: dish1.id, product_id: 4, quantity_per_dish: 8)
Ingredient.create(dish_id: dish1.id, product_id: 5, quantity_per_dish: 1)

Ingredient.create(dish_id: dish2.id, product_id: 1, quantity_per_dish: 20)
Ingredient.create(dish_id: dish2.id, product_id: 2, quantity_per_dish: 3)
Ingredient.create(dish_id: dish2.id, product_id: 6, quantity_per_dish: 270)
Ingredient.create(dish_id: dish2.id, product_id: 4, quantity_per_dish: 8)
Ingredient.create(dish_id: dish2.id, product_id: 5, quantity_per_dish: 1)

Ingredient.create(dish_id: dish3.id, product_id: 6, quantity_per_dish: 20)
Ingredient.create(dish_id: dish3.id, product_id: 2, quantity_per_dish: 3)
Ingredient.create(dish_id: dish3.id, product_id: 3, quantity_per_dish: 270)
Ingredient.create(dish_id: dish3.id, product_id: 4, quantity_per_dish: 8)
Ingredient.create(dish_id: dish3.id, product_id: 5, quantity_per_dish: 1)

DishType.create(name: "śniadanie")
DishType.create(name: "drugie śniadanie")
DishType.create(name: "obiad")
DishType.create(name: "podwieczorek")
DishType.create(name: "deser")
DishType.create(name: "kolacja")
DishType.create(name: "lunch")
DishType.create(name: "przekąska")
