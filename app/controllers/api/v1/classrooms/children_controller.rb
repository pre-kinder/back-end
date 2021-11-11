class Api::V1::Classrooms::ChildrenController < ApplicationController
  def index
    classroom = Classroom.find(params[:classroom_id].to_i)
    students = classroom.children
    json_response(ChildrenSerializer.new(students))
  end

  private

  def child_params
    params.require(:parent).permit(:first_name, :last_name, :birthday, :parent_id, :classroom_id)
  end
end
