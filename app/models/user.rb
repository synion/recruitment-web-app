require 'csv'
class User < ApplicationRecord
  has_many :interests, inverse_of: :user
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum gender: { male: 0, female: 1 }
  accepts_nested_attributes_for :interests, reject_if: :all_blank, allow_destroy: true

  def self.to_csv
    UsersCsvExport.new(includes(:interests)).generate
  end

  def self.create_by_admin(attr)
    self.create(attr.merge(password: "secret"))
  end
end
