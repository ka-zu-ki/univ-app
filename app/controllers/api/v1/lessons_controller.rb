class Api::V1::LessonsController < ApplicationController
  def index
    lessons = Lesson.all

    render json: lessons, status: :ok
  end

  def show
    lesson = Lesson.find(params[:id])

    render json: lesson, status: :ok
  end
end
