require 'rails_helper'

RSpec.describe RegardMailerController, type: :controller do
  let(:user) { create :user }
  let(:check_user) { create :user, email: "example3@o2.pl", password: "password"}

   describe 'POST #create' do
    before { sign_in user }
    let!(:params) do
      { user_id: check_user.id }
    end
    subject  { post :create, params: params }

    context 'success' do
      it { expect(response).to have_http_status(:ok) }
    end
  end
end
