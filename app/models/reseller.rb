class Reseller < ActiveRecord::Base

	attr_accessible :name, :appDomain, :marketing_type,
					:bundleurl, :bundlename ,:wl_folder,
					:logo_url, :website,:address,:entity_type,
					:logo,:theme, :checkout_type, :bundle_type
	self.table_name = "reseller"

end