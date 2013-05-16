class Site < ActiveRecord::Base
    has_and_belongs_to_many :users, :join_table => 'user_sites'

    has_many :invoice, :class_name => "Invoice",
  	:foreign_key => "site_id"


end