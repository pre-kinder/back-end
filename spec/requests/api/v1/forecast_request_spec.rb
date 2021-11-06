require 'rails_helper'

RSpec.describe 'Forecast API' do
  describe "Index Page" do
    it "sends 5 day forecast data" do

      get '/api/v1/forecast?q=denver'

      expect(response).to be_successful

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast[:data].count).to eq(5)
      expect(forecast[:data]).to have_key(:weather)
      expect(forecast[:data][:main]).to have_key(:temp)
      expect(forecast[:data][:main][:temp]).to be_an(Integer)
    end
  end
end
