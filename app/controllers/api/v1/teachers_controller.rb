class Api::V1::TeachersController < ApplicationController

  def index
    teachers = Teacher.all
    json_response TeachersSerializer.new(teachers)
  end
end
