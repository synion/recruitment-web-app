require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }

  describe 'GET #index with login admin' do
    before { sign_in user }
    subject { get :index }

    it_behaves_like 'template rendering action', :index
  end

  describe 'GET #index without login' do
    subject { get :index }

    it { is_expected.to redirect_to new_user_session_path }
  end
end
