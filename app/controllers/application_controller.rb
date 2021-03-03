class ApplicationController < ActionController::API
  include ActionController::Cookies
  skip_before_action :verify_authenticity_token, raise: false
  before_action :slow_load
  
  def slow_load
    sleep(1)
  end

end
