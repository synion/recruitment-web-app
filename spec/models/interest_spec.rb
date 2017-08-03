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

  describe '#amount_interest_cosmhealth_young_woman' do
    let(:matching_woman) { User.create_by_admin(email: 'lola@o2.pl',
                 age: 22, gender: :female, interests_attributes: [name: "cosmopolitan", type: :health]) }
    let(:user1) { User.create_by_admin(email: 'lola1@o2.pl',
                 age: 33, gender: :female, interests_attributes: [name: "cosmopolitan", type: :health]) }
    let(:user2) { User.create_by_admin(email: 'lola2@o2.pl',
                 age: 22, gender: :male, interests_attributes: [name: "cosmopolitan", type: :health]) }
    let(:user3) { User.create_by_admin(email: 'lola3@o2.pl',
                 age: 22, gender: :female, interests_attributes: [name: "coasmopolitan", type: :health]) }

    it { Interest.amount_interest_cosmhealth_young_woman.eql? 1 }
  end
end
