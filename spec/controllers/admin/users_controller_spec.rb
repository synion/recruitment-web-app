require 'rails_helper'

describe Admin::UsersController, type: :controller do
  let!(:user) { create :user }
  let!(:admin) { create :admin }
  let!(:user_check) { create :user, email: 'example@ppa.pl', password: 'password' }

  describe 'GET #index with login admin' do
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

  describe 'GET #new with login admin' do
    before { sign_in admin }
    subject { get :new }

    it_behaves_like 'template rendering action', :new
  end

  describe 'GET #new with regular login' do
    before { sign_in user }
    subject { get :new }

    it { is_expected.to redirect_to root_path }
  end

  describe 'GET #new with logout' do
    subject { get :new }

    it { is_expected.to redirect_to new_user_session_path }
  end

  describe 'POST #create with login admin' do
    before { sign_in admin }
    let!(:params)  { { email: 'example@pl.pl' } }
    subject { post :create, params: { user: params } }

    context 'success' do
      it { is_expected.to redirect_to admin_path }

      it 'creates user' do
        expect { subject }.to change(User, :count).by(1)
      end
    end
  end

  describe 'POST #create with regular login' do
    before { sign_in user }
    let!(:params) { { email: 'example@pl.pl' } }
    subject { post :create, params: { user: params } }

    it { is_expected.to redirect_to root_path }
  end

  describe 'POST #create with logout' do
    let!(:params) { { email: 'example@pl.pl' } }
    subject { post :create, params: { user: params } }

    it { is_expected.to redirect_to new_user_session_path }
  end

  describe 'GET #edit with login admin' do
    before { sign_in admin }
    subject { get :edit, params: { id: user_check.id } }

    it_behaves_like 'template rendering action', :edit
  end

  describe 'GET #edit with regular login' do
    before { sign_in user }
    subject { get :edit, params: { id: user_check.id } }

    it { is_expected.to redirect_to root_path }
  end

  describe 'GET #edit with logout' do
    subject { get :edit, params: { id: user_check.id } }

    it { is_expected.to redirect_to new_user_session_path }
  end

  describe 'PATCH #update with login admin' do
    before { sign_in admin }
    let(:email) { 'new_email@o2.pl' }
    let!(:params) do
      { id: user_check.id, user: { email: email } }
    end
    subject { put :update, params: params }

    context 'success' do
      it { is_expected.to redirect_to admin_path }

      context 'updates user' do
        subject { -> { put :update, params: params } }
        it { is_expected.to change { user_check.reload.email }.to(email) }
      end
    end
  end

  describe 'PUT #update with regular login' do
    before { sign_in user }
    let!(:user_check) { create :user, email: 'example@pl.pl', password: 'password' }
    let(:email) { 'new_email@o2.pl' }
    let!(:params) do
      { id: user_check.id, user: { email: email } }
    end
    subject { put :update, params: params }

    it { is_expected.to redirect_to root_path }
  end

  describe 'PUT #update with logout' do
    let!(:user_check) { create :user, email: 'example@pl.pl', password: 'password' }
    let(:email) { 'new_email@o2.pl' }
    let!(:params) do
      { id: user_check.id, user: { email: email } }
    end
    subject { put :update, params: params }

    it { is_expected.to redirect_to new_user_session_path }
  end
end
