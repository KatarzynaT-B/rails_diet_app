class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]
  before_action :set_products, except: :destroy

  def index
    @dishes = Dish.all
    redirect_to new_dish_path if @dishes.empty?
  end

  def show
    @ingredients_collection = calculate_ingredients_values(@dish)
    calculate_dish_values(@ingredients_collection, @dish)
  end

  def new
    @dish = Dish.new
    @dish.ingredients.build
  end

  def edit

  end

  def create
    @dish = Dish.create(dish_params)
    #@dish.ingredients.build

    if @dish.save
      params[:dish][:ingredients_attributes].each_value do |ingredient_hash|
        next if ingredient_hash[:quantity_per_dish].to_f <= 0
        @dish.ingredients.create(id: ingredient_hash['id'],
                                product_id: ingredient_hash['product_id'],
                                quantity_per_dish: ingredient_hash['quantity_per_dish'])
      end
      @ingredients_collection = calculate_ingredients_values(@dish)
      calculate_dish_values(@ingredients_collection, @dish)
      redirect_to @dish, notice: 'Dish was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    params[:dish][:ingredients_attributes].each_value do |ingredient_hash|
      next if ingredient_hash[:quantity_per_dish].to_f <= 0
      if Ingredient.exists?(id: ingredient_hash['id'])
        Ingredient.find(ingredient_hash['id']).update(product_id: ingredient_hash['product_id'], quantity_per_dish: ingredient_hash['quantity_per_dish'])
      else
        @dish.ingredients.create(id: ingredient_hash['id'],
                               product_id: ingredient_hash['product_id'],
                               quantity_per_dish: ingredient_hash['quantity_per_dish'])
      end
    end

    if @dish.update(dish_params)
      @ingredients_collection = calculate_ingredients_values(@dish)
      calculate_dish_values(@ingredients_collection, @dish)
      redirect_to @dish, notice: 'Dish was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @dish.destroy
    redirect_to dishes_url
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def set_products
    @products = Product.all
  end

  def dish_params
    params.require(:dish).permit(:dish_name, :steps, :dish_protein, :dish_fat, :dish_carbs, :dish_calories,
                                 ingredients_attributes: [:id, :quantity_per_dish, :product_id, :dish_id])
  end

end
