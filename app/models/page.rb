class Page < ActiveRecord::Base
  attr_accessible :id, :user_id, :site_id, :name, :filename, :page_type_id, :is_core, :entity_id, :created_at,:udpated_at, :invoice_id
  self.table_name = 'pages'
  self.primary_key = 'id'
end
