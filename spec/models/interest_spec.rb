require 'rails_helper'

RSpec.describe Interest, type: :model do
  describe 'database column' do
    it { should have_db_column :user_id }
    it { should have_db_column :type }
    it { should have_db_column :name }
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
  end

  describe '#number_of_interest_by_health' do
    let(:user) { User.create_by_admin(email: 'lola@o2.pl',
                 age: 22, gender: :female) }
    let(:interest) { Interest.create(name: "cosmopolitan", type: :health, user: user) }
    it { Interest.number_of_interest_by_health.eql? 1 }
  end
end
