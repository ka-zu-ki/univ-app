class Api::V1::LessonsController < ApplicationController
  def index
    lessons = Lesson.all

    render json: lessons, status: :ok
  end

  def show
    lesson = Lesson.find(params[:id])

    render json: lesson, status: :ok
  end

  def time_table_lessons
    select_lessons = Lesson.where('week = ? and time = ?', params[:week], params[:time])

    render json: select_lessons, status: :ok
  end

end
