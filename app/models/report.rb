class Report 

	def monthly(reseller_id)
		start_date  = Date.today.at_beginning_of_month
		end_date = Date.today.at_end_of_month	
		return self.buildReport(start_date,end_date,reseller_id)
	end

	def weekly(reseller_id)
		start_date  = Date.today.at_beginning_of_week
		end_date = Date.today.at_end_of_week
		return self.buildReport(start_date,end_date,reseller_id)
	end

	def daily(reseller_id)
		start_date  = Date.today
		end_date = Date.today
		return self.buildReport(start_date,end_date,reseller_id)
	end

	def buildReport (start_date,end_date,reseller_id)

		if reseller_id != false
			sites = Site::where(:created_at => start_date..end_date).joins(:user_sites).joins(:users).where('users.reseller_id' => reseller_id)
			users = User::where(:created_at => start_date..end_date, :reseller_id => reseller_id)
			invoices = Invoice::where(:created_at => start_date..end_date).joins(:users).where('users.reseller_id' => reseller_id)
		else
			sites = Site::where(:created_at => start_date..end_date)
			users = User::where(:created_at => start_date..end_date)
			invoices = Invoice::where(:created_at => start_date..end_date)
		end

		data = Hash.new
		data[:sites] = sites
		data[:users] = users
		data[:invoices] = invoices
		data[:start_date] = start_date
		data[:end_date] = end_date
		return data
	end	

end
