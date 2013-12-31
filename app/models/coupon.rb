class Coupon < ActiveRecord::Base
	attr_accessible :name, :code,:discount,:reseller_id, :discount_type, :start_date, :end_date, :status,:description

end