class ApplicationController < ActionController::API
  before_action :slow_load
  
  def slow_load
    sleep(1)
  end
end
