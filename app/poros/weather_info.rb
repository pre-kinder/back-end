class WeatherInfo
  attr_reader :temp,
              :temp_main,
              :temp_max,
              :description,
              :icon,
              :wind_speed

  def initialize(data)
    @temp = data[:main][:temp]
    @temp_min = data[:main][:temp_min]
    @temp_max = data[:main][:temp_max]
    @description = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
    @wind_speed = data[:wind][:speed]
  end
end
