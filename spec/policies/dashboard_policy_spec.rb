require 'rails_helper'

RSpec.describe DashboardPolicy do
  let(:admin) { create :admin }
  let(:user) { create :user }

  context 'for regular user' do
    subject { DashboardPolicy.new(user) }
    it { should_not permit(:index) }
  end

  context 'for admin user' do
    subject { DashboardPolicy.new(admin) }
    it { should permit(:index) }
  end
end
