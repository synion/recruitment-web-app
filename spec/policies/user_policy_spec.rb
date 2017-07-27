require 'rails_helper'

describe UserPolicy do

  let(:admin) { create :admin }
  let(:user) { create :user }
  let(:check_user) { create :user, email: "example@pls.pl", password: "password"}

  context 'for regular user' do
    subject { UserPolicy.new(user,check_user) }
    it { should_not permit(:destroy) }
    it { should permit(:index) }
  end

  context 'for admin user' do
    subject { UserPolicy.new(admin,check_user) }
    it { should permit(:destroy) }
    it { should permit(:index) }
  end
end
