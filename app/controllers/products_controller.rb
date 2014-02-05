class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  include ProductsHelper

  def index
    @products = Product.all
    @product_values = {}
    @products.each do |product|
      protein_kcal, fat_kcal, carbs_kcal = grams_to_kcal(product)
      @product_values[product] = { protein: protein_kcal, fat: fat_kcal, carbs: carbs_kcal }
    end
    redirect_to new_product_path if @products.empty?
  end

  def show
    @protein_kcal, @fat_kcal, @carbs_kcal = grams_to_kcal(@product)
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        count_calories(@product)
        format.html { redirect_to @product, notice: 'Produkt dodany do listy' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        count_calories(@product)
        format.html { redirect_to @product, notice: 'Produkt został zaktualizowany' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :calories, :protein, :fat, :carbs)
    end
end
