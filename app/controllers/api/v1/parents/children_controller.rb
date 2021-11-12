class Api::V1::Parents::ChildrenController < ApplicationController
  def index
    adult = Parent.find(params[:parent_id])
    students = adult.children
    json_response(ChildrenSerializer.new(students))
  end

  # private
  #
  # def child_params
  #   params.require(:parent).permit(:first_name, :last_name, :birthday, :parent_id, :classroom_id)
  # end
end
