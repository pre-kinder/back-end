require 'rails_helper'

RSpec.describe 'Classrooms Api requests' do
  describe 'GET /api/v1/classrooms/:id' do
    context 'classroom exists' do
      it 'sends a specific classroom details' do
        classroom_1 = create(:classroom)

        get "/api/v1/classrooms/#{classroom_1.id}"

        expect(response).to have_http_status(200)

        classroom = JSON.parse(response.body, symbolize_names: true)

        expect(classroom.count).to eq(1)
        expect(classroom[:data]).to be_a(Hash)

        expect(classroom[:data]).to have_key(:id)
        expect(classroom[:data][:id]).to be_an(String)

        expect(classroom[:data]).to have_key(:attributes)
        expect(classroom[:data][:attributes]).to be_a(Hash)

        expect(classroom[:data][:attributes]).to have_key(:name)
        expect(classroom[:data][:attributes][:name]).to be_an(String)
      end
    end

    context 'classroom does NOT exist' do
      it 'sends a status code 404' do
        get "/api/v1/classrooms/123456"

        expect(response).to have_http_status(404)
        expect(response.body).to match(/Couldn't find Classroom/)
      end
    end

    context 'invalid request' do
      it 'sends a status code 404' do
        get "/api/v1/classrooms/invalid"

        expect(response).to have_http_status(404)
        expect(response.body).to match(/Couldn't find Classroom/)
      end
    end
  end
end
