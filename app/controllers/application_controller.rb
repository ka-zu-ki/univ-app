class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :slow_load
  
  def slow_load
    sleep(1)
  end
end
