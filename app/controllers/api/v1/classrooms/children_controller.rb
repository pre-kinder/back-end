class Api::V1::Classrooms::ChildrenController < ApplicationController
  def index
    class = Classroom.find(params[:id])
    students = class.children
    json_response(ChildrenSerializer.new(students))
  end

  private

  def child_params
    params.require(:parent).permit(:first_name, :last_name, :birthday, :parent_id, :classroom_id)
  end
end
