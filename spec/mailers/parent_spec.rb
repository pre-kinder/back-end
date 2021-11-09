require "rails_helper"

RSpec.describe ParentMailer, type: :mailer do
  describe "Sign Up" do
    it 'sends the thanks for signing up email to parent' do
      parent = build(:parent)
      mail = described_class.with(parent: parent).sign_up_email

      expect(mail.subject).to eq("Thanks for Signing Up!")
      expect(mail.to).to eq([parent.email])
      expect(mail.from).to eq(['notification.prekinder@gmail.com'])
      expect(mail.body.encoded). to match(/Hi #{parent.first_name}/)
    end
  end
end
