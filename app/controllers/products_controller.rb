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
    if @product.save
      count_calories(@product)
      redirect_to @product, notice: 'Produkt dodany do listy'
    else
      render action: 'new'
    end
  end

  def update
    if @product.update(product_params)
      count_calories(@product)
      redirect_to @product, notice: 'Produkt został zaktualizowany'
    else
      render action: 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :calories, :protein, :fat, :carbs)
  end
end
