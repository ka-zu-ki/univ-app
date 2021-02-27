class Api::V1::MyclassesController < ApplicationController
  before_action :authenticate_api_v1_user!

  # def index
  #   myclasses = current_user.myclasses.all

  #   render json: myclasses, status: :ok
  # end
  
  
  def create
    myclass = current_api_v1_user.myclasses.build(lesson_id: params[:lesson_id])
    myclass.save!

    render json: myclass
  end
end
