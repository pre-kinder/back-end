class ForecastSerializer
  include JSONAPI::Serializer

  attributes :avg_temp, :daily_icon, :description,
             :date, :daily_will_it_rain, :daily_will_it_snow,
             :daily_chance_of_rain, :daily_chance_of_snow
end
