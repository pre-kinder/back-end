require 'rails_helper'

RSpec.describe 'Children Api requests' do
  describe 'GET /parents/:id/children' do
    context 'parent exists and has children' do
      it 'returns a list of all parent children' do
        parent = create(:parent)
        all_children = create_list(:child, 3, parent: parent)

        get "/api/v1/parents/#{parent.id}/children"

        expect(response).to have_http_status(200)

        children = JSON.parse(response.body, symbolize_names: true)

        expect(children[:data].count).to eq(3)

        children[:data].each do |child|
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

          expect(child[:attributes]).to have_key(:parent_id)
          expect(child[:attributes][:parent_id]).to be_an(Integer)

          expect(child[:attributes]).to have_key(:classroom_id)
          expect(child[:attributes][:classroom_id]).to be_an(Integer)
        end
      end
    end

    context 'parent exists and has NO children' do
       it 'returns a 200 status code and data is an empty array' do
         parent = create(:parent)

         get "/api/v1/parents/#{parent.id}/children"

         expect(response).to have_http_status(200)

         children = JSON.parse(response.body, symbolize_names: true)

         expect(children[:data]).to eq([])
       end
    end

    context 'parent does NOT exist' do
      it 'returns an error message and 404 status code' do

        get "/api/v1/parents/string/children"

        expect(response).to have_http_status(404)
        expect(response.body).to match(/Couldn't find Parent/)
      end
    end
  end
end
