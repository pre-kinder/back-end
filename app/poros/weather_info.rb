class WeatherInfo
  attr_reader :id,
              :avg_temp,
              :temp_main,
              :temp_max,
              :description,
              :daily_icon,
              # :wind_speed,
              :date,
              # :current,
              # :current_icon,
              :daily_will_it_rain,
              :daily_will_it_snow,
              :daily_chance_of_snow,
              :daily_chance_of_rain

  def initialize(data)
    @id = nil
    @avg_temp = data[:day][:avgtemp_f]
    @temp_min = data[:day][:mintemp_f]
    @temp_max = data[:day][:maxtemp_f]
    @description = data[:day][:condition][:text]
    @daily_icon = data[:day][:condition][:icon]
    # @wind_speed = data[:current][:wind_mph]
    @date = data[:date]
    # @current = data[:current][:temp_f]
    # @current_icon = data[:current][:condition][:icon]
    @daily_will_it_rain = data[:day][:daily_will_it_rain]
    @daily_will_it_snow = data[:day][:daily_will_it_snow]
    @daily_chance_of_rain = data[:day][:daily_chance_of_rain]
    @daily_chance_of_snow = data[:day][:daily_chance_of_snow]
  end
end
