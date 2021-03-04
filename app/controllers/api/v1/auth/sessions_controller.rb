class Api::V1::Auth::SessionsController < ApplicationController
  def login
    if !current_user.nil?
      render json: { user: current_user }
    else
      user = User.find_by(email: params[:email])
      
      if user && @user.authenticate(params[:password])
        session[:user_id] = user.id
        
        render json: { user: user }
      else
        render json: { status: 401, error: ['ログインに失敗しました'] }
      end
    end
  end

  def logout
    current_user = nil
    session.delete(:user_id)
    
    render json: { status: 200, user: current_user }
  end

  def logged_in?
    if current_user
      render json: { user: current_user }
    else
      render json: { status: 204 }
    end
  end
  
  private
  def session_params
    params.require(:user).permit(:email, :password)
  end

end
