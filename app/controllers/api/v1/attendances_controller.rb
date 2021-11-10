class Api::V1::AttendancesController < ApplicationController
  before_action :find_classroom, :find_child
  before_action :find_attendance, only: [:show, :update, :destroy]

  def index
    attendances = @classroom.attendances
    json_response(AttendancesSerializer.new(attendances))
  end

  def show
    json_response(AttendancesSerializer.new(@attendance))
  end

  def create
    attendance = @classroom.attendances.create!(attendance_params)
    json_response(AttendancesSerializer.new(attendance), :created)
  end

  def update
    @attendance.update!(attendance_params)
    json_response(AttendancesSerializer.new(@attendance), :accepted)
  end

  def destroy
    @attendance.destroy
    head :no_content
  end


  private
  def find_child
    @child = Child.find(params[:child_id])
  end

  def find_classroom
    @classroom = Classroom.find(params[:classroom_id])
  end

  def find_attendance
    @attendance = @classroom.attendances.find(params[:id])
  end

  def attendance_params
    params.require(:classroom).permit(:date, :notes, :status, :child_id, :classroom_id)
  end
end
