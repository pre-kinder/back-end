class Api::V1::TeachersController < ApplicationController

  def index
    teachers = Teacher.all
    json_response TeachersSerializer.new(teachers)
  end

  def show
    # json_response(TeachersSerializer.new(@teacher))
    teacher = Teacher.find_by(id: params[:id])
    if teacher
      render json: TeachersSerializer.new(teacher)
    end
  end
  #
  def create
    # teacher = Teacher.create!(teacher_params)
    # json_response(TeacherSerializer.new(teacher), :created)
    teacher = Teacher.new(teacher_params)
    if teacher.save
      json_response(TeachersSerializer.new(teacher), :created)
    else
      render_invalid_params('invalid parameters provided')
    end
  end
  #
  # def update
  #   @teacher.update!(teacher_params)
  #   json_response(TeacherSerializer.new(@teacher), :accepted)
  # end
  #
  # def destroy
  #   @teacher.destroy
  #   head :no_content
  # end
  #
  private
  #
  # def find_teacher
  #   @teacher = Teacher.find(params[:id])
  # end
  #
  def teacher_params
    params.require(:teacher).permit(:classroom_id, :first_name, :last_name, :email, :address, :phone_number, :google_image_url, :google_id)
  end
end
