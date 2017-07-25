class CreateInterest < ActiveRecord::Migration[5.0]
  def change
    create_table :interests do |t|
      t.belongs_to :user, index: true
    end
  end
end
