require 'rails_helper'

RSpec.describe 'Forecast API' do
  describe "Index Page" do
    it "sends 3 day forecast data" do

      # get '/api/v1/forecast?q=denver'
      #
      # expect(response).to be_successful
      # binding.pry
      # forecast = JSON.parse(response.body, symbolize_names: true)
      #
      # expect(forecast[:data].count).to eq(3)
      # expect(forecast[:data][0]).to have_key(:attributes)
      #
      # expect(forecast[:data][0][:attributes]).to have_key(:avg_temp)
      # expect(forecast[:data][0][:attributes][:avg_temp]).to be_a(Float)
      #
      # expect(forecast[:data][0][:attributes]).to have_key(:description)
      # expect(forecast[:data][0][:attributes][:description]).to be_a(String)
    end
  end
end
