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
end
