require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'database column' do
    it { should have_db_column :email }
    it { should have_db_column :encrypted_password }
    it { should have_db_column :admin }
    it { should have_db_column :gender }
    it { should have_db_column :age }
  end

  describe 'associations' do
    it { is_expected.to have_many :interests }
  end

  describe '#create_by_admin' do
    let(:user) { User.create_by_admin(email: 'lola@o2.pl') }
    it { user.valid_password?('secret').eql? true }
  end

  describe '#to_csv' do
    let!(:user) do
      create :user,
      email: 'salomon@o2.pl',
      password: 'password',
      age: 22,
      gender: :male,
      interests_attributes: [name: 'snowboarding', type: 'health']
    end
    let!(:user2) do
      create :user,
      email: 'salomon@o3.pl',
      password: 'password',
      age: 33,
      gender: :female,
      interests_attributes: [name: 'programing', type: 'work']
    end
    let(:users_with_interests) { User.includes(:interests) }

    it 'should have argument users_with_interests' do
      users_csv_export = double('UsersCsvExport')
      expect(UsersCsvExport).to receive(:new).with(users_with_interests) { users_csv_export }
      expect(users_csv_export).to receive(:generate)
      User.to_csv
    end
  end
end
