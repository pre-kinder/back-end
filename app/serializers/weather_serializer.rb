class WeatherSerializer
  include JSONAPI::Serializer

  attributes :temp, :temp_min, :temp_max, :wind_speed, :icon, :description
end
