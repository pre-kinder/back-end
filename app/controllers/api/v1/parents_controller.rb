class Api::V1::ParentsController < ApplicationController
  def index
    parents = Parent.all
    json_response(ParentSerializer.new(parents))
  end
end
