class ReportsController < ApplicationController

	def show
		reporting = Report.new 
		data = reporting.monthly(false)
		@users = data[:users]
		@sites = data[:sites]
		@invoices = data[:invoices]
		@start_date = data[:start_date]
		@end_date = data[:end_date]
	end

	def weekly
		reporting = Report.new 
		data = reporting.weekly(false)
		@users = data[:users]
		@sites = data[:sites]
		@invoices = data[:invoices]
		@start_date = data[:start_date]
		@end_date = data[:end_date]
		render template: "reports/show.html.erb"
	end

	def daily
		reporting = Report.new 
		data = reporting.daily(false)
		@users = data[:users]
		@sites = data[:sites]
		@invoices = data[:invoices]
		@start_date = data[:start_date]
		@end_date = data[:end_date]
		render template: "reports/show.html.erb"
	end

	def resellers
		@resellers = Reseller.all
		respond_to do |format|
			format.html { render :html => @resellers }
      		format.json { render :json => @resellers }
		end
	end

	def reseller
		filter = params[:filter]
		reseller_id = params[:id]
		reporting = Report.new 

		case filter # a_variable is the variable we want to compare
		
		when 'monthly'   
		  data = reporting.monthly(reseller_id)
		when 'weekly' 
		  data = reporting.weekly(reseller_id)
		 when 'daily'  
		  data = reporting.daily(reseller_id)
		else
		  data = reporting.monthly(reseller_id)
		end 

		@reseller = Reseller.find(reseller_id)
		@users = data[:users]
		@sites = data[:sites]
		@invoices = data[:invoices]
		@start_date = data[:start_date]
		@end_date = data[:end_date]
		render template: "reports/reseller.html.erb"
	end

end