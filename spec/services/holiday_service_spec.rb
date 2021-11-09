require 'rails_helper'

RSpec.describe 'holiday service' do
  it 'returns holidays for the next year given a country', :vcr do
    response = HolidayService.get_yearly_holidays("US")

    expect(response).to be_an(Array)
    expect(response.first).to be_a(Hash)
    expect(response.first).to have_key(:date)
    expect(response.first).to have_key(:localName)
    expect(response.first).to have_key(:name)
  end
end
