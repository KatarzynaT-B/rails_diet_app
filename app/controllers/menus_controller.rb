class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :set_dish_types, except: :destroy
  before_action :set_dishes, except: :destroy

  include MenusHelper

  def index
    @menus = Menu.all
    redirect_to new_menu_path if @menus.empty?
  end

  def show
    @products = Product.all
    @meals = @menu.meals
  end

  def new
    @menu = Menu.new
    @menu.meals.build(position: 1)
  end

  def edit
    #@menu.meals.order(:position)
  end

  def create
    meals_to_remove = []
    @menu = Menu.create(menu_params)
    @menu.meals.each do |meal|
      if meal.position == 0
        meals_to_remove.push meal.id
      end
    end
    meals_to_remove.each do |id|
      @menu.meals.find(id).destroy
    end
    update_menu_with_values(@menu, @dishes)

    if @menu.save
      redirect_to @menu, notice: 'Jadłospis dodany do bazy'
    else
      render action: 'new'
    end
  end

  def update
    meals_to_remove = []
    params[:menu][:meals_attributes].each_value do |meal_hash|
      if meal_hash['position'].to_f == 0
        meals_to_remove.push meal_hash['id']
      else
        if Meal.exists?(id: meal_hash['id'])
          Meal.find(meal_hash['id']).update(dish_id: meal_hash['dish_id'], dish_type_id: meal_hash['dish_type_id'], position: meal_hash['position'])
        else
          @menu.meals.create(id: meal_hash['id'],
                             dish_id: meal_hash['dish_id'],
                             dish_type_id: meal_hash['dish_type_id'],
                             position: meal_hash['position'])
        end
      end
    end
    if @menu.update(menu_params)
      meals_to_remove.each do |id|
        @menu.meals.find(id).destroy
      end
      update_menu_with_values(@menu, @dishes)
      redirect_to @menu, notice: 'Jadłospis został zaktualizowany'
    else
      render action: 'edit'
    end
  end

  def destroy
    @menu.destroy
    redirect_to menus_url
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def set_dish_types
    @dish_types = DishType.all
  end

  def set_dishes
    @dishes = Dish.all
  end

  def menu_params
    params.require(:menu).permit(:menu_date, :meals_no, :calories, :protein, :fat, :carbs,
                                 meals_attributes: [:id, :dish_type_id, :dish_id, :menu_id, :position])
  end
end
