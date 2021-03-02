class Api::V1::MyclassesController < ApplicationController
  before_action :authenticate_api_v1_user!

  def create
    myclass = current_api_v1_user.myclasses.build(lesson_id: params[:lesson_id])
    myclass.save!

    render json: myclass
  end
end
