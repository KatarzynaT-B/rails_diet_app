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

    respond_to do |format|
      if @dish_type.save
        format.html { redirect_to @dish_type, notice: 'Artykuł dodany do bazy' }
        format.json { render action: 'show', status: :created, location: @dish_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @dish_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @dish_type.update(dish_type_params)
        format.html { redirect_to @dish_type, notice: 'Artykuł został zaktualizowany' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dish_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dish_type.destroy
    respond_to do |format|
      format.html { redirect_to dish_types_url }
      format.json { head :no_content }
    end
  end

  private

  def set_dish_type
    @dish_type = DishType.find(params[:id])
  end


  def dish_type_params
    params.require(:dish_type).permit(:name)
  end
end
