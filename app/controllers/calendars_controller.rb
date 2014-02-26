class CalendarsController < ApplicationController
  include DateAndTime
  include CalendarsHelper
  include DateAndTime::Calculations

  before_action :set_dish_types, :set_dishes, :set_products

  def day
    if params[:date]
      @date = Date.strptime(params[:date], "%Y-%m-%d")
    else
      @date = Date.strptime(Time.now.strftime("%Y-%m-%d"))
    end
    @menu = Menu.find_by(menu_date: @date)
    if @menu
      @meals = @menu.meals
    end
  end

  def week

  end

  def month
    @months = declare_month_names
    @week_days = declare_weekday_names

    if params[:year_month]
      @date = Date.strptime(params[:year_month] + '-05', "%Y-%m-%d")
    else
      @date = Date.strptime(Time.now.strftime("%Y-%m-%d"))
    end

    @weeks = build_weeks(@date)
    @month = @date.month
    @year = @date.year

  end

  private
    def set_products
      @products = Product.all
    end

    def set_dishes
      @dishes = Dish.all
    end

    def set_dish_types
      @dish_types = DishType.all
    end

end
