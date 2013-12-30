class UserSession

	def authenticate(username, password)
	    
	    if (username == AdminUsers::LOGIN[:username] && password == AdminUsers::LOGIN[:password])
	    	return true
	    else
	    	return false
	    end
	end

end