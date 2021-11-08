class Api::V1::ClassroomsController < ApplicationController

  def create
    classroom = Classroom.create!(classroom_params)
    json_response(ClassroomSerializer.new(classroom), :created)
  end

  def show
    classroom = Classroom.find(params[:id])
    json_response(ClassroomSerializer.new(classroom))
  end

  private

  def classroom_params
    params.require(:classroom).permit(:name)
  end
end
