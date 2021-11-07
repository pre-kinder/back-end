class Api::V1::ChildrenController < ApplicationController

  def index
    classroom = Classroom.find(params[:classroom_id])
    children = classroom.children
    json_response(ChildrenSerializer.new(children))
  end
end
