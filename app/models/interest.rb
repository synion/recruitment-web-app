class Interest < ApplicationRecord
  self.inheritance_column = :_type_disabled
  enum type: { health: 0, hobby: 1, work: 2 }
  belongs_to :user

  private

    def self.number_of_interest_by_health
      self.where('type = 0').
      where('name Like :prefix', prefix: 'cosm%').
      joins(:user).
      where('age between 20 and 30 AND gender = 1').count
    end
end
