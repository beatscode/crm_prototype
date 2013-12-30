class LoginController < ApplicationController

	def index

	end

	def logout
	  session[:username] = nil
	  redirect_to login, :notice => "Logged out!"
	end

	def complete
		user_session = UserSession.new
	 	status = user_session.authenticate(params[:username], params[:password]);

	 	if status
			session[:username] = params[:username]
	    	redirect_to root_url, :notice => "Logged in!"
	 	else
	 		flash[:notice] = "Invalid username or password"
	 	end

	end  

end
