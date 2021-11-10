class Api::V1::Events::EventsController < ApplicationController
  def index
    class = Classroom.find(params[:id])
    special_days = class.events
    json_response(EventSerializer.new(special_days))
  end

  private

  def event_params
    params.require(:classroom).permit(:title, :description, :date, :time, :classroom_id)
  end
end
