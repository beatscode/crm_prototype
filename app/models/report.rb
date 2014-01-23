class Report 

	def monthly()
		start_date  = Date.today.at_beginning_of_month
		end_date = Date.today.at_end_of_month	

		return self.buildReport(start_date,end_date)
	end

	def weekly
		start_date  = Date.today.at_beginning_of_week
		end_date = Date.today.at_end_of_week
		return self.buildReport(start_date,end_date)
	end

	def buildReport (start_date,end_date)

		sites = Site::where(:created_at => start_date..end_date)
		users = User::where(:created_at => start_date..end_date)
		invoices = Invoice::where(:created_at => start_date..end_date)

		data = Hash.new
		data[:sites] = sites
		data[:users] = users
		data[:invoices] = invoices
		data[:start_date] = start_date
		data[:end_date] = end_date
		return data
	end	

	
	def searchByResller(reseller_id)

	end

	def search(range)
		
	end

end
