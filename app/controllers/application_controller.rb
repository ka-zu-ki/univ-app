class ApplicationController < ActionController::API
  include ActionController::Cookies
  skip_before_action :verify_authenticity_token, raise: false
  before_action :slow_load
  
  def slow_load
    sleep(0.5)
  end

  def current_user
    @current_user = @current_user || User.find_by(id: session[:user_id])
  end

end
