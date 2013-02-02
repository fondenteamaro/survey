class ApplicationController < ActionController::Base
  before_filter :login_required, :except => [:login]
  include ControllerAuthentication
  protect_from_forgery

end
