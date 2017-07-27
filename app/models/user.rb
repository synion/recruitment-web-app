class User < ApplicationRecord
  has_many :interests
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum gender: { male: 0, female: 1 }
end
