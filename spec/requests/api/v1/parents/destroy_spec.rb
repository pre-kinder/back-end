require 'rails_helper'

RSpec.describe 'Parents API Requests' do
  describe 'DESTROY /parents/:id' do
    context 'parent exists' do
      it 'destroys the parent' do
        parent = create(:parent)

        delete "/api/v1/parents/#{parent.id}"

        expect(response).to have_http_status(204)
        expect(response.body).to eq('')
      end
    end

    context 'parent does not exist' do
      it 'returns a failure message and 404 status code' do
        delete '/api/v1/parents/12345'

        expect(response).to have_http_status(404)
        expect(response.body).to match(/Couldn't find Parent/)
      end
    end
  end
end
