class ApplicationController < ActionController::API
  # skip_before_action :verify_authenticity_token

  before_action :slow_load

  def login!
    session[:user_id] = @user.id
  end
  
  def slow_load
    sleep(1)
  end
  
end
