require 'rails_helper'

RSpec.describe 'Parents Api requests' do
  describe 'GET /api/v1/parents/:id' do
    context 'parent exists' do
      it 'sends a specific parent details' do
        parent_1 = create(:parent)

        get "/api/v1/parents/#{parent_1.id}"

        expect(response).to have_http_status(200)

        parent = JSON.parse(response.body, symbolize_names: true)

        expect(parent.count).to eq(1)
        expect(parent[:data]).to be_a(Hash)

        expect(parent[:data]).to have_key(:id)
        expect(parent[:data][:id]).to be_an(String)

        expect(parent[:data]).to have_key(:attributes)
        expect(parent[:data][:attributes]).to be_a(Hash)

        expect(parent[:data][:attributes]).to have_key(:first_name)
        expect(parent[:data][:attributes][:first_name]).to be_an(String)

        expect(parent[:data][:attributes]).to have_key(:last_name)
        expect(parent[:data][:attributes][:last_name]).to be_an(String)

        expect(parent[:data][:attributes]).to have_key(:email)
        expect(parent[:data][:attributes][:email]).to be_an(String)

        expect(parent[:data][:attributes]).to have_key(:address)
        expect(parent[:data][:attributes][:address]).to be_an(String)

        expect(parent[:data][:attributes]).to have_key(:phone_number)
        expect(parent[:data][:attributes][:phone_number]).to be_an(String)

        expect(parent[:data][:attributes]).to have_key(:google_image_url)
        expect(parent[:data][:attributes][:google_image_url]).to be_an(String)

        expect(parent[:data][:attributes]).to have_key(:google_id)
        expect(parent[:data][:attributes][:google_id]).to be_an(String)
      end
    end

    context 'parent does NOT exist' do
      it 'sends a status code 404' do
        get "/api/v1/parents/123456"

        expect(response).to have_http_status(404)
        expect(response.body).to match(/Couldn't find Parent/)
      end
    end

    context 'invalid request' do
      it 'sends a status code 404' do
        get "/api/v1/parents/invalid"

        expect(response).to have_http_status(404)
        expect(response.body).to match(/Couldn't find Parent/)
      end
    end
  end
end
