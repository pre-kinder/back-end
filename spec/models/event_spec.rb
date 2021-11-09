require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'relationships' do
    it { should belong_to(:classroom) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:time) }
  end
end
