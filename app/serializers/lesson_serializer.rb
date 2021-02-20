class LessonSerializer < ActiveModel::Serializer
  attributes :id, :name, :professor, :period, :room, :content
end
