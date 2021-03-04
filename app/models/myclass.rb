class Myclass < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  scope :same_time_lesson?, -> (now_lesson_id) {}
end
