require 'rails_helper'

RSpec.describe 'Teachers index endpoint' do
  it 'returns a list of teachers in a classroom' do
    create(:classroom, :with_teachers)

    get "/api/v1/teachers"

    expect(response).to be_successful

    teachers = JSON.parse(response.body, symbolize_names: true)

    expect(teachers).to be_a(Hash)

    expect(teachers).to have_key(:data)
    expect(teachers[:data]).to be_an(Array)

    teachers[:data].each do |teacher|
      expect(teacher).to have_key(:id)
      expect(teacher[:id]).to be_a(String)

      expect(teacher).to have_key(:attributes)
      expect(teacher[:attributes]).to be_a(Hash)

      expect(teacher[:attributes]).to have_key(:first_name)
      expect(teacher[:attributes]).to have_key(:last_name)
      expect(teacher[:attributes]).to have_key(:email)
      expect(teacher[:attributes]).to have_key(:address)
      expect(teacher[:attributes]).to have_key(:phone_number)
      expect(teacher[:attributes]).to have_key(:google_image_url)
      expect(teacher[:attributes]).to have_key(:google_id)

      teacher[:attributes].each do |teacher_attribute|
        expect(teacher[:attributes][:first_name]).to be_a(String)
        expect(teacher[:attributes][:last_name]).to be_a(String)
        expect(teacher[:attributes][:email]).to be_a(String)
        expect(teacher[:attributes][:address]).to be_a(String)
        expect(teacher[:attributes][:phone_number]).to be_a(String)
        expect(teacher[:attributes][:google_image_url]).to be_a(String)
        expect(teacher[:attributes][:google_id]).to be_a(String)
      end
    end
  end

  it 'returns an empty array if there are no teachers' do
    create(:classroom)

    get "/api/v1/teachers"

    teachers = JSON.parse(response.body, symbolize_names: true)

    expect(teachers).to have_key(:data)
    expect(teachers[:data]).to be_an(Array)
    expect(teachers[:data]).to eq([])
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
