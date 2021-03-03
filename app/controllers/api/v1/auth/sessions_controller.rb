class Api::V1::Auth::SessionsController < ApplicationController
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      render json: { user: @user }
    else
      render json: { status: 401, error: ['ログインに失敗しました'] }
    end
  end

  def logout
    reset_session
    @current_user = nil
    
    render json: { status: 200, user: @current_user }
  end

  def logged_in?
    @current_user = @current_user || User.find_by(id: session[:user_id])
    if @current_user
      render json: { user: @current_user }
    else
      render json: { status: 204 }
    end
  end
  
  private
  def session_params
    params.require(:user).permit(:email, :password)
  end

  # def current_user
  #   current_user = current_user || User.find_by(id: session[:user_id])
  # end
end
