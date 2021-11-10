require 'rails_helper'

RSpec.describe 'Teachers create endpoint' do
  it 'can update a teacher' do
    classroom = create(:classroom, :with_teachers)
    teacher = classroom.teachers.first
    previous_first_name = teacher.first_name

    patch "/api/v1/teachers/#{teacher.id}", params: { teacher: {first_name: "Gertrude"} }
    updated_teacher = Teacher.find_by(id: teacher.id)

    expect(response).to be_successful
    expect(updated_teacher.first_name).to eq("Gertrude")
    expect(updated_teacher.first_name).to_not eq(previous_first_name)
  end

  it 'cannot update a teacher that does not exist' do
    patch "/api/v1/teachers/2", params: { teacher: {first_name: "Steve"} }

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end
end
