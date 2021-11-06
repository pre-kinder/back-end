class Api::V1::ParentsController < ApplicationController
  before_action :find_parent, only: [:show, :update]

  def index
    parents = Parent.all
    json_response(ParentSerializer.new(parents))
  end

  def show
    json_response(ParentSerializer.new(@parent))
  end

  def create
    parent = Parent.create!(parent_params)
    json_response(ParentSerializer.new(parent), :created)
  end

  def update
    @parent.update!(parent_params)
    json_response(ParentSerializer.new(@parent), :accepted)
  end

  private

  def find_parent
    @parent = Parent.find(params[:id])
  end

  def parent_params
    params.require(:parent).permit(:first_name, :last_name, :email, :address, :phone_number, :google_image_url, :google_id)
  end
end
