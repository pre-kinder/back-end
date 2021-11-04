require 'rails_helper'

RSpec.describe 'holiday poro' do
  it 'exists' do
    holiday = Holiday.new(date: "2021-11-26", localName: "National Mariah Carey Day", name: "Ear Muff Day")

    expect(holiday).to be_a(Holiday)
    expect(holiday.date).to eq("2021-11-26")
    expect(holiday.local_name).to eq("National Mariah Carey Day")
    expect(holiday.name).to eq("Ear Muff Day")
    expect(holiday.id).to eq("20211126")
  end
end
