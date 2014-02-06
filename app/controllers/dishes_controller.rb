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
    respond_to do |format|
      if @dish.save
        @ingredients_collection = calculate_ingredients_values(@dish)
        calculate_dish_values(@ingredients_collection, @dish)
        format.html { redirect_to @dish, notice: 'Dish was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dish }
      else
        format.html { render action: 'new' }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @dish.update(dish_params)
        @ingredients_collection = calculate_ingredients_values(@dish)
        calculate_dish_values(@ingredients_collection, @dish)
        format.html { redirect_to @dish, notice: 'Dish was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to dishes_url }
      format.json { head :no_content }
    end
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
                                    ingredients_attributes: [:quantity_per_dish, :product_id, :dish_id])
    end

end
