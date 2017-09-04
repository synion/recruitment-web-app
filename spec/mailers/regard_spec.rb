require 'rails_helper'

RSpec.describe RegardMailer, type: :mailer do
  describe 'send_regard' do
    let(:user) { create :user, email: 'example@o2.pl', password: 'password' }
    let(:current_user) do
      create :user, email: 'example2@o2.pl', password: 'password'
    end
    let(:mail) do
      RegardMailer.send_regard(
        user_email: user.email,
        current_user_email: current_user.email
      )
    end
    it 'renders the headers' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(current_user.email)
    end

    it 'renders the body with wrong user' do
      expect(mail.body.encoded).to_not match(user.email)
    end

    it 'renders the headers email deliver' do
      expect(mail.to).to_not eq([current_user.email])
    end
  end
end
