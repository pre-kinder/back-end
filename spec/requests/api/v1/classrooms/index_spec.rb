require 'rails_helper'

RSpec.describe 'Classrooms Api requests' do
  describe 'GET /classrooms' do
    context 'when data is available' do
      it 'sends a list of classrooms' do
        create_list(:classroom, 25)

        get '/api/v1/classrooms'

        expect(response).to have_http_status(200)

        rooms = JSON.parse(response.body, symbolize_names: true)

        expect(rooms[:data].count).to eq(25)
        expect(rooms[:data]).to be_a(Array)

        rooms[:data].each do |room|
          expect(room).to have_key(:id)
          expect(room[:id]).to be_an(String)

          expect(room).to have_key(:attributes)
          expect(room[:attributes]).to be_a(Hash)

          expect(room[:attributes]).to have_key(:name)
          expect(room[:attributes][:name]).to be_an(String)
        end
      end
    end

    context 'when data is NOT available' do
      it 'sends an empty array' do
        get '/api/v1/classrooms'

        expect(response).to have_http_status(200)

        classrooms = JSON.parse(response.body, symbolize_names: true)

        expect(classrooms[:data]).to eq([])
      end
    end
  end
end
