require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'database column' do
    it { should have_db_column :email }
    it { should have_db_column :encrypted_password }
    it { should have_db_column :admin }
  end
end
