require 'rails_helper'

RSpec.describe 'Forecast API' do
  describe "Index Page" do
    it "sends 5 day forecast data" do
    

      get '/api/v1/forecast'

      expect(response).to be_successful

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast[:list].count).to eq(5)
      expect(forecast[:list]).to have_key(:weather)
      expect(forecast[:list][:main]).to have_key(:temp)
      expect(forecast[:list][:main][:temp]).to be_an(Integer)
    end
  end
end
