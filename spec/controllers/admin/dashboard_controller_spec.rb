require 'rails_helper'

describe Admin::DashboardController, type: :controller do
  let(:user) { create :user }
  let(:admin) { create :admin }

  describe 'GET #index with admin' do
    before { sign_in admin }
    subject { get :index }

    it_behaves_like 'template rendering action', :index
  end

  describe 'GET #index with regular login' do
    before { sign_in user }
    subject { get :index }

    it { is_expected.to redirect_to root_path }
  end

  describe 'GET #index with logout' do
    subject { get :index }

    it { is_expected.to redirect_to new_user_session_path }
  end
end
