require 'rails_helper'

RSpec.describe 'Teachers show endpoint' do
  it 'returns one teacher based on an id' do

    classroom = create(:classroom, :with_teachers)

    get "/api/v1/classrooms/#{classroom.id}/teachers/#{classroom.teachers.first.id}"

    expect(response).to be_successful
  end
end
