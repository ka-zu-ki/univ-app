class LessonSerializer < ActiveModel::Serializer
  attributes :id, :name, :professor, :week, :time, :room, :content
end
