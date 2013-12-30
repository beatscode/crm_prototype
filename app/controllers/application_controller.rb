class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_user
	  if session[:username]
	     # set current user object to @current_user object variable
	    @current_user = session[:username] 
	    return true	
	  else
	    redirect_to(:controller => 'login', :action => 'index')
	    return false
	  end
	end

	def save_login_state
	  if session[:username]
	    redirect_to(:controller => 'resellers', :action => 'index')
	    return false
	  else
	    return true
	  end
	end
end
