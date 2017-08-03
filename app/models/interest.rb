class Interest < ApplicationRecord
  self.inheritance_column = :_type_disabled
  enum type: { health: 0, hobby: 1, work: 2 }
  belongs_to :user
  scope :cosm_health, -> { where("type = 0 and name like 'cosm%'") }
  scope :young_woman, -> { where(user_id: User.where('age between 20 and 30 AND gender = 1')) }

  private

  def self.female_interests
    cosm_health.young_woman.count
  end
end
