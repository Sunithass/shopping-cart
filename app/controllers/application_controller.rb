class ApplicationController < ActionController::Base
layout 'store'
helper :all 
 protect_from_forgery :secret => '8fc080370e56e929a2d5afca5540a0f7'

protected

def authorize
  unless User.find_by_id(session[:user_id])
    session[:original_uri] = request.url
    flash[:notice] = "Please log in"
    redirect_to(:controller => "admin", :action => "login")
end
end
end
