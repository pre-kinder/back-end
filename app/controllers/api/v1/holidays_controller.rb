class Api::V1::HolidaysController < ApplicationController

  def index
    @holidays = HolidayFacade.next_three_holidays("US")
    json_response(HolidaySerializer.new(@holidays))
    # render json:HolidaySerializer.new(@holidays)
  end

end
