require 'rails_helper'

RSpec.describe 'Classroom children Api requests' do
  describe 'GET /api/v1/children/:id' do
    context 'child exists' do
      it 'sends a specific child details' do
        classroom = create(:classroom)
        child = create(:child, classroom: classroom)

        get "/api/v1/children/#{child.id}"

        expect(response).to have_http_status(200)

        child = JSON.parse(response.body, symbolize_names: true)

        expect(child.count).to eq(1)
        expect(child[:data]).to be_a(Hash)

        expect(child[:data]).to have_key(:id)
        expect(child[:data][:id]).to be_an(String)

        expect(child[:data]).to have_key(:attributes)
        expect(child[:data][:attributes]).to be_a(Hash)

        expect(child[:data][:attributes]).to have_key(:first_name)
        expect(child[:data][:attributes][:first_name]).to be_an(String)

        expect(child[:data][:attributes]).to have_key(:last_name)
        expect(child[:data][:attributes][:last_name]).to be_an(String)

        expect(child[:data][:attributes]).to have_key(:birthday)
        expect(child[:data][:attributes][:birthday]).to be_an(String)

        expect(child[:data][:attributes]).to have_key(:classroom_id)
        expect(child[:data][:attributes][:classroom_id]).to be_an(Integer)
      end
    end

    context 'child does NOT exist' do
      it 'sends a status code 404' do
        create(:classroom)
        get "/api/v1/children/123456"

        expect(response).to have_http_status(404)
        expect(response.body).to match(/Couldn't find Child/)
      end
    end

    context 'invalid request' do
      it 'sends a status code 404' do
        create(:classroom)
        get "/api/v1/children/invalid"

        expect(response).to have_http_status(404)
        expect(response.body).to match(/Couldn't find Child/)
      end
    end
  end
end
