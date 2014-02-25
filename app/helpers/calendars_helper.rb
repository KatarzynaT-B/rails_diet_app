module CalendarsHelper
  def find_menu(day_string)
    months = declare_month_names
    day = day_string.split(" ")[0].to_i
    month = months.invert[day_string.split(" ")[1]]
    year = Time.now.year
    date = Date.new(year, month, day)
    Menu.find_by(menu_date: date)
  end

  def declare_month_names
    {1 => 'styczeń', 2 => 'luty', 3 => 'marzec', 4 => 'kwiecień', 5 => 'maj', 6 => 'czerwiec',
     7 =>'lipiec', 8 => 'sierpień', 9 => 'wrzesień', 10 => 'październik', 11 => 'listopad', 12 => 'grudzień'}
  end
end
