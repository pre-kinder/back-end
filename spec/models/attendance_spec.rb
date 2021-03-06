require 'rails_helper'

RSpec.describe Attendance, type: :model do
  describe 'relationships' do
    it { should belong_to(:classroom) }
    it { should belong_to(:child) }
  end

  describe 'validations' do
    it { should validate_presence_of(:child_id) }
    it { should validate_presence_of(:classroom_id) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:notes) }
    it { should validate_presence_of(:status) }
    it { should allow_value(:present).for(:status) }
    it { should allow_value(:absent).for(:status) }
    it { should allow_value(:late).for(:status) }
    it { should allow_value(:sick).for(:status) }
  end
end
