require 'rails_helper'

RSpec.describe 'Parents Api requests' do
  describe 'GET /parents' do
    context 'when data is available' do
      it 'sends a list of parents' do
        create_list(:parent, 25)

        get '/api/v1/parents'

        expect(response).to have_http_status(200)

        parents = JSON.parse(response.body, symbolize_names: true)

        expect(parents[:data].count).to eq(25)
        expect(parents[:data]).to be_a(Array)

        parents[:data].each do |parent|
          expect(parent).to have_key(:id)
          expect(parent[:id]).to be_an(String)

          expect(parent).to have_key(:attributes)
          expect(parent[:attributes]).to be_a(Hash)

          expect(parent[:attributes]).to have_key(:first_name)
          expect(parent[:attributes][:first_name]).to be_an(String)

          expect(parent[:attributes]).to have_key(:last_name)
          expect(parent[:attributes][:last_name]).to be_an(String)

          expect(parent[:attributes]).to have_key(:email)
          expect(parent[:attributes][:email]).to be_an(String)

          expect(parent[:attributes]).to have_key(:address)
          expect(parent[:attributes][:address]).to be_an(String)

          expect(parent[:attributes]).to have_key(:phone_number)
          expect(parent[:attributes][:phone_number]).to be_an(String)

          expect(parent[:attributes]).to have_key(:google_image_url)
          expect(parent[:attributes][:google_image_url]).to be_an(String)

          expect(parent[:attributes]).to have_key(:google_id)
          expect(parent[:attributes][:google_id]).to be_an(String)
        end
      end
    end

    context 'when data is NOT available' do
      it 'sends an empty array' do
        get '/api/v1/parents'

        expect(response).to have_http_status(200)

        parents = JSON.parse(response.body, symbolize_names: true)

        expect(parents[:data]).to eq([])
      end
    end
  end
end
