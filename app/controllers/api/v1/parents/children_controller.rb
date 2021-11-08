class Api::V1::Parents::ChildrenController < ApplicationController

  def index
    parent = Parent.find(params[:id])
    children = parent.children
    json_response(ChildrenSerializer.new(children))
  end
end
