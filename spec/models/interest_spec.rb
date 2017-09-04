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

  describe '#female_interests' do
    let(:matching_woman) do
      User.create_by_admin(email: 'lola@o2.pl',
      age: 22, gender: :female,
      interests_attributes: [name: 'cosmopolitan', type: :health])
    end

    let(:no_matching_age) do
      User.create_by_admin(email: 'lola1@o2.pl',
      age: 33, gender: :female,
      interests_attributes: [name: 'cosmopolitan', type: :health])
    end

    let(:no_matching_gender) do
      User.create_by_admin(email: 'lola2@o2.pl',
      age: 22, gender: :male,
      interests_attributes: [name: 'cosmopolitan', type: :health])
    end

    let(:no_maching_name) do
      User.create_by_admin(
        email: 'lola3@o2.pl',
        age: 22, gender: :female,
        interests_attributes: [name: 'coasmopolitan', type: :health]
      )
    end
    let(:no_matching_type) do
      User.create_by_admin(
        email: 'lola3@o2.pl',
        age: 22, gender: :female,
        interests_attributes: [name: 'coasmopolitan', type: :hobby]
      )
    end

    it { Interest.female_interests.eql? 1 }
  end

  describe '#cosm_health' do
    let(:matching_interest) { Interest.create(name: 'cosmos', type: :health) }
    let(:no_matching_name) { Interest.create(name: 'cross', type: :health) }
    let(:no_matching_type) { Interest.create(name: 'cosmos', type: :hobby) }

    it { Interest.cosm_health.count.eql? 1 }
    it { Interest.cosm_health.first.eql? matching_interest }
  end

  describe '#young_woman' do
    let(:matching_woman) do
      User.create_by_admin(
        email: 'lola@o2.pl',
        age: 22, gender: :female,
        interests_attributes: [name: 'cosmopolitan', type: :health]
      )
    end

    let(:no_matching_age) do
      User.create_by_admin(
        email: 'lola1@o2.pl',
        age: 33, gender: :female,
        interests_attributes: [name: 'cosmopolitan', type: :health]
      )
    end

    let(:no_matching_gender) do
      User.create_by_admin(
        email: 'lola2@o2.pl',
        age: 22, gender: :male,
        interests_attributes: [name: 'cosmopolitan', type: :health]
      )
    end

    it { Interest.cosm_health.count.eql? 1 }
    it { Interest.cosm_health.first.eql? matching_woman }
  end
end
