class Interest < ApplicationRecord
  self.inheritance_column = :_type_disabled
  enum type: { health: 0, hobby: 1, work: 2 }
  belongs_to :user
  scope :amount_interest_cosmhealth_young_woman, -> { where("type = 0 and name like 'cosm%'").
                                            where(user_id: User.where('age between 20 and 30 AND gender = 1')).
                                            count }
end
