require 'rails_helper'

RSpec.describe Child, type: :model do
  describe 'relationships' do
    it { should belong_to(:classroom) }
    it { should belong_to(:parent) }
    it { should have_many(:attendances) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:birthday) }
    it { should validate_presence_of(:classroom_id) }
    it { should validate_presence_of(:parent_id) }
  end
end
