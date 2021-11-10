require 'rails_helper'

RSpec.describe 'Teachers show endpoint' do
  it 'returns one teacher based on an id' do

    classroom = create(:classroom, :with_teachers)
    teacher_1 = classroom.teachers.first

    get "/api/v1/teachers/#{teacher_1.id}"
    expect(response).to be_successful

    teacher = JSON.parse(response.body, symbolize_names: true)

    expect(teacher).to have_key(:data)
    expect(teacher[:data]).to be_a(Hash)

    expect(teacher[:data][:id]).to be_a(String)
    expect(teacher[:data][:attributes]).to be_a(Hash)

    expect(teacher[:data][:attributes]).to have_key(:first_name)
    expect(teacher[:data][:attributes][:first_name]).to be_a(String)

    expect(teacher[:data][:attributes]).to have_key(:last_name)
    expect(teacher[:data][:attributes][:last_name]).to be_a(String)

    expect(teacher[:data][:attributes]).to have_key(:email)
    expect(teacher[:data][:attributes][:email]).to be_a(String)

    expect(teacher[:data][:attributes]).to have_key(:address)
    expect(teacher[:data][:attributes][:address]).to be_a(String)

    expect(teacher[:data][:attributes]).to have_key(:phone_number)
    expect(teacher[:data][:attributes][:phone_number]).to be_a(String)

    expect(teacher[:data][:attributes]).to have_key(:google_image_url)
    expect(teacher[:data][:attributes][:google_image_url]).to be_a(String)

    expect(teacher[:data][:attributes]).to have_key(:google_id)
    expect(teacher[:data][:attributes][:google_id]).to be_a(String)
  end

  it 'returns an error if item id is not valid' do
    classroom = Classroom.create!(name: "Class 1")
    create(:teacher, classroom_id: "#{classroom.id}", id: 1)

    get "/api/v1/teachers/2"

    expect(response.status).to eq(400)
  end
end
