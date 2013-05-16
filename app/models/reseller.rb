class Reseller < ActiveRecord::Base
    include Rails.application.routes.url_helpers
	attr_accessible :name, :appDomain, :marketing_type,
					:bundleurl, :bundlename ,:wl_folder,
					:logo_url, :website,:address,:entity_type,
					:logo,:theme, :checkout_type, :bundle_type
	self.table_name = "reseller"
    has_many :users

    def show_image(r)
       # link_to image_tag( r.logo_url ), edit_reseller_path(r), :title => r.name if r.logo_url
       "#{r.name}"
    end
end