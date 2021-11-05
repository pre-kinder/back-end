require 'rails_helper'

RSpec.describe Parent, type: :model do
  describe 'relationships' do
    it { should have_many(:children) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:phone_number) }
    it { should validate_presence_of(:google_image_url) }
    it { should validate_presence_of(:google_id) }
  end
end
