class LoginController < ApplicationController

	def index
	end

	def complete
		session = UserSession.new
		salt = BCrypt::Engine.generate_salt
		abort(BCrypt::Engine.hash_secret(params[:password],salt))
	 	session.set(params[:email], params[:password]);
	end  

end
