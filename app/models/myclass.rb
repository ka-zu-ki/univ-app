class Myclass < ApplicationRecord
  has_many :todos

  belongs_to :user
  belongs_to :lesson
end
