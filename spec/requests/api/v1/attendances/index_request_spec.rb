require 'rails_helper'

RSpec.describe 'Attendances index endpoint' do
  it 'returns a list of attendances in a classroom' do
    create(:classroom, :with_attendances)

    get "/api/v1/attendances"

    expect(response).to be_successful

    attendances = JSON.parse(response.body, symbolize_names: true)

    expect(attendances).to be_a(Hash)

    expect(attendances).to have_key(:data)
    expect(attendances[:data]).to be_an(Array)

    attendances[:data].each do |attendance|
      expect(attendance).to have_key(:id)
      expect(attendance[:id]).to be_a(String)

      expect(attendance).to have_key(:attributes)
      expect(attendance[:attributes]).to be_a(Hash)

      expect(attendance[:attributes]).to have_key(:first_name)
      expect(attendance[:attributes]).to have_key(:last_name)
      expect(attendance[:attributes]).to have_key(:email)
      expect(attendance[:attributes]).to have_key(:address)
      expect(attendance[:attributes]).to have_key(:phone_number)
      expect(attendance[:attributes]).to have_key(:google_image_url)
      expect(attendance[:attributes]).to have_key(:google_id)

      # teacher[:attributes].each do |teacher_attribute|
      #   expect(teacher[:attributes][:first_name]).to be_a(String)
      #   expect(teacher[:attributes][:last_name]).to be_a(String)
      #   expect(teacher[:attributes][:email]).to be_a(String)
      #   expect(teacher[:attributes][:address]).to be_a(String)
      #   expect(teacher[:attributes][:phone_number]).to be_a(String)
      #   expect(teacher[:attributes][:google_image_url]).to be_a(String)
      #   expect(teacher[:attributes][:google_id]).to be_a(String)
      # end
    end
  end

  it 'returns an empty array if there are no attendances' do
    create(:classroom)

    get "/api/v1/attendances"

    attendances = JSON.parse(response.body, symbolize_names: true)

    expect(attendances).to have_key(:data)
    expect(attendances[:data]).to be_an(Array)
    expect(attendances[:data]).to eq([])
  end

  it 'only returns teachers within a given classroom' do
    classroom = create(:classroom, :with_teachers)
    classroom_2 = create(:classroom, :with_teachers)
    teacher_1 = classroom.teachers.first
    teacher_2 = classroom_2.teachers.first

    get "/api/v1/teachers"

    expect(response).to be_successful

    teachers = JSON.parse(response.body, symbolize_names: true)

    expect(teachers[:data].first[:attributes][:first_name]).to eq(teacher_1.first_name)
    expect(teachers[:data].first[:attributes][:first_name]).to_not eq(teacher_2.first_name)
  end
end
