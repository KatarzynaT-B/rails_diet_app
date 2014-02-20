class CalendarsController < ApplicationController
  include DateAndTime

  #before_action :set_date

  def day

  end

  def week

  end

  def month
    months = {1 => 'styczeń', 2 => 'luty', 3 => 'marzec', 4 => 'kwiecień', 5 => 'maj', 6 => 'czerwiec',
              7 =>'lipiec', 8 => 'sierpień', 9 => 'wrzesień', 10 => 'październik', 11 => 'listopad', 12 => 'grudzień'}
    week_days = {1 => 'poniedziałek', 2 => 'wtorek', 3 => 'środa', 4 => 'czwartek', 5 => 'piątek', 6 => 'sobota', 7 => 'niedziela'}

    @date = Time.now
    @month = months[@date.month]
    @first_of_month = @date.beginning_of_month
    @last_of_month = @date.end_of_month
  end

  def check_weekday(date)
    date.wday == 0 ? 7 : date.wday
  end

  def count_days_in_month(date)
    Time.days_in_month(date.month, date.year)
  end

  def count_number_of_week_rows(date)
    days = count_days_in_month(date)
    first_of_month = date.beginning_of_month
    
    8 - day
  end

  #private
  #
  #  def set_date
  #    @date = Date.new(date_params)
  #  end

end
