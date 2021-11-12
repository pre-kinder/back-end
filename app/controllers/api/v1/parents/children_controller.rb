class Api::V1::Parents::ChildrenController < ApplicationController
  def index
    adult = Parent.find(params[:parent_id])
    students = adult.children
    json_response(ChildrenSerializer.new(students))
  end

end
