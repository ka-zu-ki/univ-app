class Api::V1::Auth::RegistrationsController < ApplicationController
  def signup
    user = User.new(registration_params)

    if user.save!
      session[:user_id] = user.id
      
      render json: user, status: :ok
    else
      render json: { status: 500 }
    end
  end

  private
  def registration_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end