class Api::V1::ForecastController < ApplicationController
  def index
    if params[:q].present?
      forecast = WeatherFacade.forecast(params[:q])
      render json: ForecastSerializer.new(forecast), status: :ok
    else
      render_bad_request('no city params given')
    end
  end
end
