require 'rails_helper'

RSpec.describe 'Teacher Find Query' do
  describe "#find by email" do
    it "searches a single teacher by email" do
      teacher = create(:teacher)

      get "/api/v1/teachers/find?email=#{teacher.email}"

      hash = JSON.parse(response.body, symbolize_names: true)

      expect(hash[:data].count).to eq(1)
      expect(hash[:data][0][:attributes][:email]).to eq(teacher.email)
      expect(hash[:data][0][:attributes][:first_name]).to eq(teacher.first_name)
      expect(hash[:data][0][:attributes][:last_name]).to eq(teacher.last_name)
    end

    it "throws an error when not email given" do
      create(:teacher)

      get "/api/v1/teachers/find?email="

      hash = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(hash[:error]).to eq("valid teacher params not given")
    end
  end

  describe '#find by google_id' do
    it "searches a single teacher by google_id" do
      teacher= create(:teacher)

      get "/api/v1/teachers/find?google_id=#{teacher.google_id}"

      hash = JSON.parse(response.body, symbolize_names: true)

      expect(hash[:data].count).to eq(1)
      expect(hash[:data][0][:attributes][:email]).to eq(teacher.email)
      expect(hash[:data][0][:attributes][:first_name]).to eq(teacher.first_name)
      expect(hash[:data][0][:attributes][:last_name]).to eq(teacher.last_name)
    end

    it "throws an error when not email given" do
      create(:teacher)

      get "/api/v1/teachers/find?google_id="

      hash = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(hash[:error]).to eq("valid teacher params not given")
    end
  end
end
