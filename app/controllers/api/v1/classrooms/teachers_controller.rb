class Api::V1::Classrooms::TeachersController < ApplicationController
  def index
    class = Classroom.find(params[:id])
    instructors = class.teachers
    json_response(TeacherSerializer.new(instructors))
  end

  private

  def teacher_params
    params.require(:classroom).permit(:first_name, :last_name, :email, :address, :phone_number, :google_image_url, :google_id, :classroom_id)
  end
end
