class Site < ActiveRecord::Base
  
  attr_accessible :company_id, :template_id, :emr_company_id, :emr_link, :custom_emr, :practice_name,:specialty_id, :site_type_id, :specialty, :discipline, :slogan, :step,:custom_data, :has_purchased, :site_standing, :billing_type
    has_and_belongs_to_many :users, :join_table => 'user_sites'

    has_many :invoice, :class_name => "Invoice",
  	:foreign_key => "site_id"

  	has_many :user_sites, :class_name => "UserSites",
  	:foreign_key => "site_id"


end