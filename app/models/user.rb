class User < ApplicationRecord
  has_many :myclasses
  has_many :lessons, through: :myclasses
  has_many :todos

  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
