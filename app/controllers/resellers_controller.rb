class ResellersController < ApplicationController

	def index
		@resellers = Reseller.all
		respond_to do |format|
			format.html { render :html => @resellers }
      		format.json { render :json => @resellers }
		end
	end

	def create

	end

	def edit
		@reseller = Reseller.find(params[:id])
	end

	def update
		@reseller = Reseller.find(params[:reseller][:id])
		@reseller.update_attributes(params[:reseller])
	end

	def show
		@reseller = Reseller.find(params[:id])
		@usercount= @reseller.users.count
		@users    = @reseller.users

		respond_to do |format|
			format.html # show.html.erb
			format.xml { render :xml => @reseller}
			format.json { render :json => @reseller}
		end
	end

end