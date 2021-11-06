class Api::V1::ParentsController < ApplicationController
  before_action :find_parent, only: [:show]

  def index
    parents = Parent.all
    json_response(ParentSerializer.new(parents))
  end

  def show
    json_response(ParentSerializer.new(@parent))
  end

  private

  def find_parent
    @parent = Parent.find(params[:id])
  end
end
