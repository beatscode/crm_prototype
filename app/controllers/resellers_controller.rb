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

end