class Api::V1::MyclassesController < ApplicationController
  def create
    myclass = Myclass.new(lesson_id: params[:lesson_id], user_id: params[:user_id])
    myclass.save!
    
    render json: myclass
  end
end