require 'rails_helper'

RSpec.describe 'holiday facade' do
  it 'can return a list of holidays', :vcr do
    holidays = HolidayFacade.next_three_holidays("US")

    expect(holidays).to be_an(Array)
    expect(holidays.first).to be_a(Holiday)
    expect(holidays.first.date).to be_a(String)
    expect(holidays.first.local_name).to be_a(String)
    expect(holidays.first.name).to be_a(String)
    expect(holidays.count).to eq(3)
  end
end
