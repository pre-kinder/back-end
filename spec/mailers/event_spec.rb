require "rails_helper"

RSpec.describe EventMailer, type: :mailer do
  describe "#new_event_email" do
    it 'sends the upcoming event email to parents' do
      parent1 = create(:parent)
      parent2 = create(:parent)
      parent3 = create(:parent)

      event = build(:event)

      mail = described_class.with(event: event).new_event_email

      expect(mail.subject).to eq("Upcoming Event")
      expect(mail.from).to eq(['notification.prekinder@gmail.com'])
      expect(mail.to).to eq([parent1.email, parent2.email, parent3.email])
      expect(mail.body.encoded). to match(/Event Title:/)
    end
  end
end
