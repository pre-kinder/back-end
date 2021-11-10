require 'rails_helper'

RSpec.describe 'Teachers create endpoint' do
  it 'can create a teacher' do
    classroom = create(:classroom)
    teacher_params = { classroom_id: "#{classroom.id}", first_name: "Gladys", last_name: "Ernstein", email: "gernstein@hotmail.com", address: "123 Main Street", phone_number: "123-345-5678", google_image_url: "www.gladysiscool.biz", google_id: "457"}

    post "/api/v1/teachers", params: { teacher: teacher_params }

    expect(response).to be_successful
    expect(response.status).to eq(201)

    teacher = JSON.parse(response.body, symbolize_names: true)

    expect(teacher).to have_key(:data)
    expect(teacher[:data]).to be_a(Hash)

    expect(teacher[:data][:id]).to be_a(String)
    expect(teacher[:data][:type]).to be_a(String)
    expect(teacher[:data][:attributes]).to be_a(Hash)

    expect(teacher[:data][:attributes]).to have_key(:first_name)
    expect(teacher[:data][:attributes][:first_name]).to be_a(String)

    expect(teacher[:data][:attributes]).to have_key(:last_name)
    expect(teacher[:data][:attributes][:last_name]).to be_a(String)

    expect(teacher[:data][:attributes]).to have_key(:email)
    expect(teacher[:data][:attributes][:email]).to be_a(String)

    expect(teacher[:data][:attributes]).to have_key(:address)
    expect(teacher[:data][:attributes][:address]).to be_a(String)

    expect(teacher[:data][:attributes]).to have_key(:phone_number)
    expect(teacher[:data][:attributes][:phone_number]).to be_a(String)

    expect(teacher[:data][:attributes]).to have_key(:google_image_url)
    expect(teacher[:data][:attributes][:google_image_url]).to be_a(String)

    expect(teacher[:data][:attributes]).to have_key(:google_id)
    expect(teacher[:data][:attributes][:google_id]).to be_a(String)
  end

  it 'cannot create a teacher if attributes are missing' do
    classroom = create(:classroom)
    teacher_params = { classroom_id: "#{classroom.id}", first_name: "Gladys", last_name: "Ernstein", email: "gernstein@hotmail.com", address: "123 Main Street", phone_number: "123-345-5678", google_id: "457"}

    post "/api/v1/teachers", params: { teacher: teacher_params }

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end
end
