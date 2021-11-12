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

  def find
    if params_exist(params[:email])
      teacher = Teacher.search_email(params[:email])
      render json: (teacher ? TeacherSerializer.new(teacher) : { data: {} })
    elsif params_exist(params[:google_id])
      teacher = Teacher.search_google_id(params[:google_id])
      render json: (teacher ? TeacherSerializer.new(teacher) : { data: {} })
    else
      render_bad_request('valid teacher params not given')
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:classroom_id, :first_name, :last_name, :email, :address, :phone_number, :google_image_url, :google_id)
  end
end
