class Api::V1::Classrooms::EventsController < ApplicationController
  def index
    classroom = Classroom.find(params[:classroom_id].to_i)
    special_days = classroom.events
    json_response(EventSerializer.new(special_days))
  end

  private

  def event_params
    params.require(:classroom).permit(:title, :description, :date, :time, :classroom_id)
  end
end
