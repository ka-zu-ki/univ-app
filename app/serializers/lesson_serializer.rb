class LessonSerializer < ActiveModel::Serializer
  attributes :name, :professor, :period, :content
end
