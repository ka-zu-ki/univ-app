class Api::V1::MyclassesController < ApplicationController
  def index
    myclasses = Myclass.where(active: 'true').where(user_id: params[:user_id])

    render json: myclasses
  end
  

  def create
    new_lesson = Lesson.find(params[:lesson_id])

    if now_lessons = Myclass.find_by(active: true)
      same_time_lesson = now_lessons.class.where('week = ? and time = ?', new_lesson.week, new_lesson.time)
    end
    
    if same_time_lesson.present?
      same_time_lesson.last.update_attribute(:active, false)

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