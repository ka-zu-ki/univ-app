class Api::V1::MyclassesController < ApplicationController
  def create
    new_lesson = Lesson.find(params[:lesson_id])

    if now_lessons = Myclass.find_by(active: true)
      same_time_lesson = now_lessons.class.where('week = ? and time = ?', new_lesson.week, new_lesson.time)
    end
    
    if same_time_lesson
      same_time_lesson.first.update_attribute(:active, false)

      myclass = Myclass.new(
        lesson_id: new_lesson.id,
        user_id: params[:user_id],
        week: new_lesson.week,
        time: new_lesson.time,
        active: true
      )
    else
      myclass = Myclass.new(
        lesson_id: new_lesson.id, 
        user_id: params[:user_id],
        week: new_lesson.week,
        time: new_lesson.time,
        active: true
      )
    end

    myclass.save!
    
    render json: myclass
  end
end