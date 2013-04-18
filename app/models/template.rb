class Template < ActiveRecord::Base
	establish_connection "templates_#{RAILS_ENV}"
	attr_accessible :name, :creator, :layout,
					:path, :hidden, :approved,:description,
					:created_at, :updated_at, :requested_approval_at

end