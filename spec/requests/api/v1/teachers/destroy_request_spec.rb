require 'rails_helper'

RSpec.describe 'Teachers destroy endpoint' do
  it 'can destroy a teacher' do
    classroom = create(:classroom, :with_teachers)
    teacher_1 = classroom.teachers.first

    expect(Teacher.count).to eq(3)

    delete "/api/v1/classrooms/#{classroom.id}/teachers/#{teacher_1.id}"

    expect(response).to be_successful
    expect(response.status).to eq(204)
    expect(response.body).to be_empty
    expect(Teacher.count).to eq(2)
  end
end
