class Api::V1::ChildrenController < ApplicationController
  before_action :find_classroom
  before_action :find_child, only: [:show, :update, :destroy]

  def index
    children = @classroom.children
    json_response(ChildrenSerializer.new(children))
  end

  def show
    json_response(ChildrenSerializer.new(@child))
  end

  def create
    child = @classroom.children.create!(child_params)
    json_response(ChildrenSerializer.new(child), :created)
  end

  def update
    @child.update!(child_params)
    json_response(ChildrenSerializer.new(@child), :accepted)
  end

  def destroy
    @child.destroy
    head :no_content
  end


  private

  def find_classroom
    @classroom = Classroom.find(params[:classroom_id])
  end

  def find_child
    @child = @classroom.children.find(params[:id])
  end

  def child_params
    params.require(:parent).permit(:first_name, :last_name, :birthday, :attendance_status, :parent_id, :classroom_id)
  end
end
