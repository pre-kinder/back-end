require 'rails_helper'

RSpec.describe 'Parents API Requests' do
  describe 'PATCH /parents/:id' do
    context 'parent exists' do
      context 'attributes are present and valid' do
        it 'updates the parent and returns a 202 status code' do
          parent = create(:parent)
          parent_params = {
            first_name: 'new first name',
            last_name: 'new last name',
            email: 'new email',
            address: 'new address',
            phone_number: 'new phone_number',
            google_image_url: 'new google_image_url',
            google_id: 'new google_id',
          }
          headers = { 'CONTENT_TYPE' => 'application/json' }

          patch "/api/v1/parents/#{parent.id}", headers: headers, params: JSON.generate(parent: parent_params)

          updated_parent = Parent.find(parent.id)
          binding.pry
          expect(response).to have_http_status(202)

          expect(updated_parent.first_name).to eq(parent_params[:first_name])
          expect(updated_parent.last_name).to eq(parent_params[:last_name])
          expect(updated_parent.email).to eq(parent_params[:email])
          expect(updated_parent.address).to eq(parent_params[:address])
          expect(updated_parent.phone_number).to eq(parent_params[:phone_number])
          expect(updated_parent.google_image_url).to eq(parent_params[:google_image_url])
          expect(updated_parent.google_id).to eq(parent_params[:google_id])

          response_parent = JSON.parse(response.body, symbolize_names: true)

          expect(response_parent[:data]).to be_a(Hash)

          data = response_parent[:data]
          expect(data[:id]).to eq(parent.id.to_s)
          expect(data[:type]).to eq('parent')
          expect(data[:attributes]).to be_a(Hash)

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

      context 'only one attribute is present and valid' do
        it 'updates the parent and returns a 202 status code' do
          parent = create(:parent)
          parent_params = {
            first_name: 'new first name'
          }
          headers = { 'CONTENT_TYPE' => 'application/json' }

          patch "/api/v1/parents/#{parent.id}", headers: headers, params: JSON.generate(parent: parent_params)

          updated_parent = Parent.find(parent.id)

          expect(response).to have_http_status(202)

          expect(updated_parent.first_name).to eq(parent_params[:first_name])
          expect(updated_parent.last_name).to eq(parent.last_name)
          expect(updated_parent.email).to eq(parent.email)
          expect(updated_parent.address).to eq(parent.address)
          expect(updated_parent.phone_number).to eq(parent.phone_number)
          expect(updated_parent.google_image_url).to eq(parent.google_image_url)
          expect(updated_parent.google_id).to eq(parent.google_id)
        end
      end

      context 'invalid attribute is present' do
        it 'returns a failure message and 422 if validations fail, will not update' do
          parent_1 = create(:parent)
          parent_2 = create(:parent, email: 'abc@gmail.com')

          parent_params = {
            email: 'abc@gmail.com'
          }
          headers = { 'CONTENT_TYPE' => 'application/json' }

          patch "/api/v1/parents/#{parent_1.id}", headers: headers, params: JSON.generate(parent: parent_params)

          expect(Parent.find(parent_1.id).email).to eq(parent_1.email)

          expect(response).to have_http_status(422)
          expect(response.body).to match(/Validation failed: Email has already been taken/)
        end
      end
    end

    context 'parent does NOT exist' do
      it 'returns a failure message and 404 status code' do
        parent_params = {
          first_name: 'new first name'
        }
        headers = { 'CONTENT_TYPE' => 'application/json' }

        patch '/api/v1/parents/string', headers: headers, params: JSON.generate(parent: parent_params)

        expect(response).to have_http_status(404)
        expect(response.body).to match(/Couldn't find Parent/)
      end
    end
  end
end
