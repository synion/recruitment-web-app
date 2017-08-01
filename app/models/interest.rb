class Interest < ApplicationRecord
  self.inheritance_column = :_type_disabled
  enum type: { health: 0, hobby: 1, work: 2 }
  belongs_to :user, optional: true
end
