class WeatherService < BaseService
  def request_api(path)
    response = conn('https://api.weatherapi.com').get(path) do |faraday|
      faraday.params['key'] = ENV['pusher_key']
      faraday.params['days'] = '7'
      faraday.params['aqi'] = 'yes'
      faraday.params['alerts'] = 'yes'
    end
    parse_json(response)
  end

  def self.get_5_day_forecast_data(city)
    new.request_api("/v1/forecast.json?q=#{city}")
  end
end
