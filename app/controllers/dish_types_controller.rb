class DishTypesController < ApplicationController
  before_action :set_dish_type, only: [:edit, :update, :destroy]

  def index
    @dish_types = DishType.all
    redirect_to new_dish_type_path if @dish_types.empty?
  end

  def new
    @dish_type = DishType.new
  end

  def edit
  end

  def create
    @dish_type = DishType.new(dish_type_params)
    if @dish_type.save
      redirect_to @dish_type, notice: 'Artykuł dodany do bazy'
    else
      render action: 'new'
    end
  end

  def update
    if @dish_type.update(dish_type_params)
      redirect_to @dish_type, notice: 'Artykuł został zaktualizowany'
    else
      render action: 'edit'
    end
  end

  def destroy
    @dish_type.destroy
    redirect_to dish_types_url
  end

  private

  def set_dish_type
    @dish_type = DishType.find(params[:id])
  end


  def dish_type_params
    params.require(:dish_type).permit(:name)
  end
end
