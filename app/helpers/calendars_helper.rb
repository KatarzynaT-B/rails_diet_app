module CalendarsHelper

  include DateAndTime
  include DateAndTime::Calculations

  def find_menu(day_string, date)
    months = declare_month_names
    day_no_menu = day_string.split(" ")[0].to_i
    month = months.invert[day_string.split(" ")[1]]
    year = date.year
    date = Date.new(year, month, day_no_menu)
    Menu.find_by(menu_date: date)
  end

  def declare_month_names
    {1 => 'styczeń', 2 => 'luty', 3 => 'marzec', 4 => 'kwiecień', 5 => 'maj', 6 => 'czerwiec',
     7 =>'lipiec', 8 => 'sierpień', 9 => 'wrzesień', 10 => 'październik', 11 => 'listopad', 12 => 'grudzień'}
  end

  def declare_weekday_names
    {1 => 'poniedziałek', 2 => 'wtorek', 3 => 'środa', 4 => 'czwartek', 5 => 'piątek', 6 => 'sobota', 7 => 'niedziela'}
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

  def list_end_days_for_month(date)
    months = declare_month_names
    first_of_month = weekday_number(date.beginning_of_month)
    days_till_first = first_of_month - 1
    prev_month_date = date.beginning_of_month.yesterday
    days_in_prev_month = count_days(prev_month_date)
    prev_month_days_list = []
    while days_till_first > 0
      prev_month_days_list << "#{days_in_prev_month} #{months[prev_month_date.month]}"
      days_till_first -= 1
      days_in_prev_month -=1
    end
    prev_month_days_list.reverse!
  end

  def list_days_till_sunday(date)
    months = declare_month_names
    first_of_month = weekday_number(date.beginning_of_month)
    current_month_days_first_week = []
    current_month_day = 1
    until first_of_month > 7
      current_month_days_first_week << "#{current_month_day} #{months[date.month]}"
      current_month_day += 1
      first_of_month += 1
    end
    current_month_days_first_week
  end

  def first_week(date)
    (list_end_days_for_month(date)).concat(list_days_till_sunday(date))
  end

  def last_week(date)
    date_new = date.end_of_month.tomorrow
    (list_end_days_for_month(date_new)).concat(list_days_till_sunday(date_new))
  end

  def each_middle_week(start_day, date)
    months = declare_month_names
    week = []
    (0..6).each do |i|
      week << "#{start_day + i} #{months[date.month]}"
    end
    week
  end

  def start_day_for_middle_weeks(date)
    ((first_week(date))[-1].split(" "))[0].to_i + 1
  end

  def build_weeks(date)
    weeks_number = total_weeks_number(date)
    last_week = last_week(date)
    first_day_of_second_week = start_day_for_middle_weeks(date)
    weeks_for_month = {}
    weeks_for_month[1] = first_week(date)
    i = 2
    starting_step = 0
    while i < weeks_number
      weeks_for_month[i] = each_middle_week(first_day_of_second_week + starting_step, date)
      i += 1
      starting_step += 7
    end
    weeks_for_month[weeks_number] = last_week
    weeks_for_month
  end

end

