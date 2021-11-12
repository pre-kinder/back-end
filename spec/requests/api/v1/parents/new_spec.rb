require 'rails_helper'

RSpec.describe 'Parents Api requests' do
  describe 'POST /api/v1/parents' do
    context 'all attributes are present and valid' do
      it 'creates a parent and returns a 201 status code' do
        parent_params = {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: Faker::Internet.email,
          address: Faker::Address.full_address,
          phone_number: Faker::PhoneNumber.cell_phone,
          google_image_url: Faker::Avatar.image,
          google_id: Faker::Alphanumeric.alphanumeric(number: 21)
        }
        # headers = { 'CONTENT_TYPE' => 'application/json' }
        # post :create, params: { parent: parent_params }
        post '/api/v1/parents', params: parent_params
        #   first_name: Faker::Name.first_name,
        #   last_name: Faker::Name.last_name,
        #   email: Faker::Internet.email,
        #   address: Faker::Address.full_address,
        #   phone_number: Faker::PhoneNumber.cell_phone,
        #   google_image_url: Faker::Avatar.image,
        #   google_id: Faker::Alphanumeric.alphanumeric(number: 21)
        # }

        # Faraday.post('localhost:5000/api/v1/parents', parent_params)

        created_parent = Parent.last
        expect(response).to have_http_status(201)

        expect(created_parent.first_name).to eq(parent_params[:first_name])
        expect(created_parent.last_name).to eq(parent_params[:last_name])
        expect(created_parent.email).to eq(parent_params[:email])
        expect(created_parent.address).to eq(parent_params[:address])
        expect(created_parent.phone_number).to eq(parent_params[:phone_number])
        expect(created_parent.google_image_url).to eq(parent_params[:google_image_url])
        expect(created_parent.google_id).to eq(parent_params[:google_id])

        parent = JSON.parse(response.body, symbolize_names: true)

        expect(parent[:data]).to be_a(Hash)

        data = parent[:data]
        expect(data[:attributes]).to have_key(:first_name)
        expect(data[:attributes][:first_name]).to be_an(String)

        expect(data[:attributes]).to have_key(:last_name)
        expect(data[:attributes][:last_name]).to be_an(String)

        expect(data[:attributes]).to have_key(:email)
        expect(data[:attributes][:email]).to be_an(String)

        expect(data[:attributes]).to have_key(:address)
        expect(data[:attributes][:address]).to be_an(String)

        expect(data[:attributes]).to have_key(:phone_number)
        expect(data[:attributes][:phone_number]).to be_an(String)

        expect(data[:attributes]).to have_key(:google_image_url)
        expect(data[:attributes][:google_image_url]).to be_an(String)

        expect(data[:attributes]).to have_key(:google_id)
        expect(data[:attributes][:google_id]).to be_an(String)
      end
    end

    context 'all attributes are present but invalid' do
      it 'returns a failure message and 422 status code' do
        existing_parent = create(:parent, email: "abc@gmail.com")
        parent_params = {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: "abc@gmail.com",
          address: Faker::Address.full_address,
          phone_number: Faker::PhoneNumber.cell_phone,
          google_image_url: Faker::Avatar.image,
          google_id: Faker::Alphanumeric.alphanumeric(number: 21)
        }
        headers = { 'CONTENT_TYPE' => 'application/json' }

        post '/api/v1/parents', headers: headers, params: JSON.generate(parent: parent_params)

        expect(response).to have_http_status(422)
        expect(response.body).to match(/has already been taken/)
      end
    end

    context 'Not all attributes are present' do
      it 'returns a failure message and 422 status code' do
        parent_params = {
          first_name: Faker::Name.first_name,
          email: Faker::Internet.email,
          address: Faker::Address.full_address,
          phone_number: Faker::PhoneNumber.cell_phone,
          google_image_url: Faker::Avatar.image,
          google_id: Faker::Alphanumeric.alphanumeric(number: 21)
        }
        headers = { 'CONTENT_TYPE' => 'application/json' }

        post '/api/v1/parents', headers: headers, params: JSON.generate(parent: parent_params)

        expect(response).to have_http_status(422)
        expect(response.body).to match(/can't be blank/)
      end
    end
  end
end
