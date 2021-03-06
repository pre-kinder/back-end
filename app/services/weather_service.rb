class WeatherService < BaseService
  def self.request_api(path)
    response = conn('https://api.weatherapi.com').get(path) do |f|
      f.params['key'] = ENV['WEATHER_KEY']
      f.params['days'] = '3'
      f.params['aqi'] = 'yes'
      f.params['alerts'] = 'yes'
    end
    parse_json(response)
  end

  def self.get_3_day_forecast_data(city)
    request_api("/v1/forecast.json?q=#{city}")
  end
end
