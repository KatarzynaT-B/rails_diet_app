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
  end

  def new
    @menu = Menu.new
    5.times {@menu.meals.build}
  end

  def edit
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      update_menu_with_values(@menu, @dishes)
      redirect_to @menu, notice: 'Jadłospis dodany do bazy'
    else
      render action: 'new'
    end
  end

  def update
    if @menu.update(menu_params)
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
    params.require(:menu).permit(:name, :meals_no, :calories, :protein, :fat, :carbs,
                                 meals_attributes: [:id, :dish_type_id, :dish_id, :menu_id])
  end
end
