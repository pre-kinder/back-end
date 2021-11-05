class Api::V1::HolidaysController < ApplicationController

  def index
    holidays = HolidayFacade.next_three_holidays("US")
    if holidays.nil?
      json_response({ error: "Not Found" }, :not_found)
    else
      json_response(HolidaySerializer.new(holidays))
      # render json:HolidaySerializer.new(@holidays)
    end
  end
end
