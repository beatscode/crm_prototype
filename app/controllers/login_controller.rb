class LoginController < ApplicationController

	def index
		@session = Session.new(); 
	end
end
