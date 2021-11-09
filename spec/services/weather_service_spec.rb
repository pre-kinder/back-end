require 'rails_helper'

RSpec.describe WeatherService do
  before :each do
    @weather = WeatherService.new
  end

  describe "#initialize" do
    it "exists" do
      expect(@weather).to be_a(WeatherService)
    end
  end

  # context 'instance methods' do
  #   describe '#request_api' do
  #     xit 'can connect to open weather api' do
  #       response = @weather.request_api()
  #
  #       # expect(example). to have_key()
  #
  #     end
  #   end
  # end
end
