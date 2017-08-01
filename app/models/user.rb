class User < ApplicationRecord
  has_many :interests
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum gender: { male: 0, female: 1 }
  accepts_nested_attributes_for :interests, reject_if: :all_blank, allow_destroy: true

  private
  def self.create_with_password(attr={})
    default_password = "secret"
    self.create(attr.merge(password: default_password, password_confirmation: default_password))
  end
end
