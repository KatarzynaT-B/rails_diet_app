class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :set_dish_types, except: [:index, :destroy]
  before_action :set_dishes, except: [:destroy, :index]

  def index
    @menus = Menu.all
    redirect_to new_menu_path if @menus.empty?
  end

  def show
    #@meals = @menu.meals
    @meals_collection = collect_meal_information(@menu)
    @menu_values = calculate_menu_values(@meals_collection)
  end

  def new
    @menu = Menu.new
  end

  def edit
  end

  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu, notice: 'Jadłospis dodany do bazy' }
        format.json { render action: 'show', status: :created, location: @menu }
      else
        format.html { render action: 'new' }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Jadłospis został zaktualizowany' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url }
      format.json { head :no_content }
    end
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def set_dish_types
    @dish_types = DishType.all
  end

  def menu_params
    params.require(:menu).permit(:name, :meals_no, :calories, :protein, :fat, :carbs)
  end

  def set_dishes
    @dishes = Dish.all
  end
end
