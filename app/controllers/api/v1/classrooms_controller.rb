class Api::V1::ClassroomsController < ApplicationController

  def index
    classes = Classroom.all
    json_response(ClassroomSerializer.new(classes))
  end

  def create
    classroom = Classroom.create!(classroom_params)
    json_response(ClassroomSerializer.new(classroom), :created)
  end

  def show
    classroom = Classroom.find(params[:id])
    json_response(ClassroomSerializer.new(classroom))
  end

  # def children
  #   class = Classroom.find(params[:id])
  #   students = class.children
  #   json_response(ChildrenSerializer.new(students))
  # end

  private

  def classroom_params
    params.require(:classroom).permit(:name)
  end
end
