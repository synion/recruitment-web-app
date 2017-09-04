require 'rails_helper'

describe SendRegard do
  context '#call' do
    let(:user) { create :user, email: 'example@o2.pl', password: 'password' }
    let(:current_user) do
      create :user, email: 'example2@o2.pl', password: 'password'
    end

    it 'should have required arguments' do
      regard_mailer = double('RegardMailer')
      expect(RegardMailer).to receive(:send_regard).with(
        current_user_email: current_user.email,
        user_email: user.email
      ) { regard_mailer }
      expect(regard_mailer).to receive(:deliver)
      SendRegard.new(user_id: user.id, current_user_id: current_user.id).call
    end
  end
end
