require 'rails_helper'

RSpec.describe 'Classrooms Api requests' do
  describe 'POST /api/v1/classrooms' do
    context 'all attributes are present and valid' do
      it 'creates a classroom and returns a 201 status code' do
        classroom_params = {
          name: Faker::Educator.course_name
        }
        headers = { 'CONTENT_TYPE' => 'application/json' }

        post '/api/v1/classrooms', headers: headers, params: JSON.generate(classroom_params)

        created_classroom = Classroom.last
        expect(response).to have_http_status(201)
        expect(created_classroom.name).to eq(classroom_params[:name])


        classroom = JSON.parse(response.body, symbolize_names: true)

        expect(classroom[:data]).to be_a(Hash)

        data = classroom[:data]
        expect(data[:attributes]).to have_key(:name)
        expect(data[:attributes][:name]).to be_an(String)

      end
    end

    context 'attributes are Not present' do
      it 'returns a failure message and 422 status code' do
        classroom_params = {
          name: ""
        }
        headers = { 'CONTENT_TYPE' => 'application/json' }

        post '/api/v1/classrooms', headers: headers, params: JSON.generate(classroom: classroom_params)

        expect(response).to have_http_status(422)
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end
end
