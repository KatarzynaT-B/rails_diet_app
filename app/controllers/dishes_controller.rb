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
    @dish = Dish.new(dish_params)
    if @dish.save
      @ingredients_collection = calculate_ingredients_values(@dish)
      calculate_dish_values(@ingredients_collection, @dish)
      redirect_to @dish, notice: 'Dish was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @dish.update(dish_params)
      @dish.ingredients.update(params[:ingredients_attributes])
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
