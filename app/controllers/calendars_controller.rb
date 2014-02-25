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
    @weeks = count_number_of_involved_weeks(@date)
  end

  def weekday_number(date)
    date.wday == 0 ? 7 : date.wday
  end

  def count_days(date)
    Time.days_in_month(date.month, date.year)
  end

  def total_weeks_number(date)
    first_of_month = weekday_number(date.beginning_of_month)
    days_after_first_sunday = count_days(date) - (8 - first_of_month)
    (days_after_first_sunday % 7 > 0) ? (2 + days_after_first_sunday / 7) : (1 + days_after_first_sunday / 7)
  end

  def first_week(date)
    list = []
    first_of_month = weekday_number(date.beginning_of_month)
    days_till_first = first_of_month - 1
    prev_month_date = date.beginning_of_month - 1 .day
    days_in_prev_month = count_days(prev_month_date)
    prev_month_days_list = []
    current_month_days_first_week = []
    current_month_day = 1
    while days_till_first > 0
      prev_month_days_list << days_in_prev_month
      days_till_first -= 1
      days_in_prev_month -=1
    end
    until first_of_month > 7
      current_month_days_first_week << current_month_day
      current_month_day += 1
      first_of_month += 1
    end
    list.concat(prev_month_days_list.reverse!).concat(current_month_days_first_week)
  end

  def build_weeks(date)
    weeks_for_month = {}
    (1..total_weeks_number(date)).each do |week_number|
      weeks_for_month[week_number] = {}
    end
  end


  #private
  #
  #  def set_date
  #    @date = Date.new(date_params)
  #  end

end
