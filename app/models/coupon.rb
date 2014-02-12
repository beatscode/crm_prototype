class Coupon < ActiveRecord::Base
	attr_accessible :name, :code,:discount,:reseller_id, :discount_type, :start_date, :end_date, :status,:description


	DISCOUNT_TYPE = [{ :name => "Fixed", :value => 1 },{ :name => "Percentage", :value => 2 } ]
	SITE_TYPE_ID = [{ :name => "Paid", :value => 1 },{ :name => "Free", :value => 2 }]
	STATUS = [{ :name => "Active", :value => 'active' },{ :name => "Inactive", :value => 'inactive' }]
	
end