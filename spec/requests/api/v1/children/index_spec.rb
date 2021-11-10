require 'rails_helper'

RSpec.describe 'Children Api requests' do
  describe 'GET /children' do
    context 'children' do
      it 'returns a list of all  children' do
        create_list(:child, 20)

        get "/api/v1/children"

        expect(response).to have_http_status(200)

        children_hash = JSON.parse(response.body, symbolize_names: true)

        expect(children_hash[:data].count).to eq(20)

        children_hash[:data].each do |child|
          expect(child).to have_key(:id)
          expect(child[:id]).to be_a(String)

          expect(child).to have_key(:attributes)
          expect(child[:attributes]).to be_a(Hash)

          expect(child[:attributes]).to have_key(:first_name)
          expect(child[:attributes][:first_name]).to be_an(String)

          expect(child[:attributes]).to have_key(:last_name)
          expect(child[:attributes][:last_name]).to be_an(String)

          expect(child[:attributes]).to have_key(:birthday)
          expect(child[:attributes][:birthday]).to be_an(String)

          expect(child[:attributes]).to have_key(:classroom_id)
          expect(child[:attributes][:classroom_id]).to be_an(Integer)
        end
      end
    end

    context 'child does NOT exist' do
      it 'returns an error message and 404 status code' do
        create(:child)
        get "/api/v1/children/8r83u420384838"

        expect(response).to have_http_status(404)
        expect(response.body).to match(/Couldn't find Child/)
      end
    end
  end
end
