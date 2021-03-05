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
        name: new_lesson.name,
        professor: new_lesson.professor,
        week: new_lesson.week,
        time: new_lesson.time,
        room: new_lesson.room,
        content: new_lesson.content,
        active: true
      )
    else
      myclass = Myclass.new(
        lesson_id: new_lesson.id, 
        user_id: params[:user_id],
        name: new_lesson.name,
        professor: new_lesson.professor,
        week: new_lesson.week,
        time: new_lesson.time,
        room: new_lesson.room,
        content: new_lesson.content,
        active: true
      )
    end

    myclass.save!
    
    render json: myclass
  end
end