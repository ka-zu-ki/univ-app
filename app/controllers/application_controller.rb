class ApplicationController < ActionController::API
  # skip_before_action :verify_authenticity_token
  before_action :slow_load

  # helper_method :login!, :current_user

  def login!
    session[:user_id] = @user.id
  end

  def current_user
    @current_user || User.find(session[:user_id]) if session[:user_id]
  end
  
  def slow_load
    sleep(1)
  end

end
