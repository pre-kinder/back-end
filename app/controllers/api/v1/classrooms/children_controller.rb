class Api::V1::Classrooms::ChildrenController < ApplicationController
  def index
    children = Child.all
    json_response(ChildrenSerializer.new(children))
  end

  private

  def child_params
    params.require(:parent).permit(:first_name, :last_name, :birthday, :parent_id, :classroom_id)
  end
end
