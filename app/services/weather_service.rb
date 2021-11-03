class WeatherService < BaseService
  def request_api(path)
    response = conn('https://api.openweathermap.org').get(path) do |faraday|
      faraday.params['appid'] = ENV['pusher_key']
      faraday.params['units'] = 'imperial'
    end
    parse_json(response)
  end

  def self.get_5_day_forecast_data(city)
    new.request_api("/data/2.5/forecast?q=#{city}")
  end
end
