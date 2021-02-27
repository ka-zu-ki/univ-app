class Lesson < ApplicationRecord
  has_many :myclasses
  has_many :users, through: :myclasses
end
