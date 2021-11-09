class WeatherFacade
  class << self
    def forecast(city)
      data = WeatherService.get_3_day_forecast_data(city)

      data[:forecast][:forecastday].map do |info|
        WeatherInfo.new(info)
      end
    end
  end
end
