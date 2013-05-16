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
		@invoices =  Invoice.includes(:invoicedetail).where("invoices.id  = invoice_details.invoice_id").all
		
		@invoices = ActiveRecord::Base.connection.select_all( "
		SELECT invoices.* 
		FROM users
		INNER JOIN user_sites
		ON users.id = user_sites.user_id
		INNER JOIN invoices
		on user_sites.site_id = invoices.site_id
		INNER JOIN reseller
		ON users.reseller_id = reseller.id
		WHERE reseller.id = #{params[:id]}" )

		respond_to do |format|
			format.html # show.html.erb
			format.xml { render :xml => @reseller}
			format.json { render :json => @reseller}
		end
	end

end