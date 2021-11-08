class Api::V1::TeachersController < ApplicationController

  def index
    teachers = Teacher.all
    json_response TeacherSerializer.new(teachers)
  end

  def show
    teacher = Teacher.find_by(id: params[:id])
    if teacher
      render json: TeacherSerializer.new(teacher)
    else
      render_invalid_params('invalid parameters provided')
    end
  end

  def create
    teacher = Teacher.new(teacher_params)
    if teacher.save
      render json: TeacherSerializer.new(teacher), status: 201
    else
      render_invalid_params('invalid parameters provided')
    end
  end

  def update
    teacher = Teacher.find_by(id: params[:id])
    if teacher && teacher.update(teacher_params)
      render json: TeacherSerializer.new(teacher)
    else
      render_invalid_params('invalid parameters provided')
    end
  end

  def destroy
    Teacher.delete(params[:id])
  end

  private

  def teacher_params
    params.require(:teacher).permit(:classroom_id, :first_name, :last_name, :email, :address, :phone_number, :google_image_url, :google_id)
  end
end
