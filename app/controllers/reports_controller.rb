
class ReportsController < ApplicationController

	def show
		reporting = Report.new 
		data = reporting.monthly
		@users = data[:users]
		@sites = data[:sites]
		@invoices = data[:invoices]
		@start_date = data[:start_date]
		@end_date = data[:end_date]
	end

	def weekly
		reporting = Report.new 
		data = reporting.weekly
		@users = data[:users]
		@sites = data[:sites]
		@invoices = data[:invoices]
		@start_date = data[:start_date]
		@end_date = data[:end_date]
		render template: "reports/show.html.erb"
	end

	def reseller
		@reseller = Resller.find(params[:user][:id])
	end

end