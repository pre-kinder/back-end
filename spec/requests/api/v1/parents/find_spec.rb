require 'rails_helper'

RSpec.describe 'Parent Find Query' do
  describe "#find by email" do
    it "searches a single parent by email" do
      parent = create(:parent)

      get "/api/v1/parents/find?email=#{parent.email}"

      parent_hash = JSON.parse(response.body, symbolize_names: true)

      expect(parent_hash[:data].count).to eq(1)
      expect(parent_hash[:data][0][:attributes][:email]).to eq(parent.email)
      expect(parent_hash[:data][0][:attributes][:first_name]).to eq(parent.first_name)
      expect(parent_hash[:data][0][:attributes][:last_name]).to eq(parent.last_name)
    end

    it "throws an error when not email given" do
      create(:parent)

      get "/api/v1/parents/find?email="

      hash = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(hash[:error]).to eq("valid parent params not given")
    end
  end

  describe '#find by google_id' do
    it "searches a single parent by google_id" do
      parent = create(:parent)

      get "/api/v1/parents/find?google_id=#{parent.google_id}"

      parent_hash = JSON.parse(response.body, symbolize_names: true)

      expect(parent_hash[:data].count).to eq(1)
      expect(parent_hash[:data][0][:attributes][:email]).to eq(parent.email)
      expect(parent_hash[:data][0][:attributes][:first_name]).to eq(parent.first_name)
      expect(parent_hash[:data][0][:attributes][:last_name]).to eq(parent.last_name)
    end

    it "throws an error when not email given" do
      create(:parent)

      get "/api/v1/parents/find?google_id="

      hash = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(hash[:error]).to eq("valid parent params not given")
    end
  end
end
