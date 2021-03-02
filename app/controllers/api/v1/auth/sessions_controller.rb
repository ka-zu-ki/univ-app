class Api::V1::Auth::SessionsController < ApplicationController
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      if session[:user_id] = @user.id
        render json: { user: @user }
      end
    else
      render json: { status: 401, error: ['ログインに失敗しました'] }
    end
  end

  def logout
    reset_session
    session[:user_id] = nil
    
    if session[:user_id] = nil
      render json: { status: 200 }
    end
  end

  def logged_in?
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
    
    render json: { user: @current_user }
  end
  
  private
  def session_params
    params.require(:user).permit(:email, :password)
  end

end
