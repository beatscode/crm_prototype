class Coupon < ActiveRecord::Base
	attr_accessible :name, :code,:discount,
					:start_date, :end_date, :status
					:description

end