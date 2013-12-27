class Domains < ActiveRecord::Base
  attr_accessible :id, :company_id, :domain_name, :site_id, :updated_at, :mednet_own
  set_table_name 'domains'
  self.primary_key = 'id'
end