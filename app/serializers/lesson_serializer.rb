class LessonSerializer < ActiveModel::Serializer
  attributes :name, :professor, :period, :room, :content
end
