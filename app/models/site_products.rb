class SiteProducts < ActiveRecord::Base
  attr_accessible :id, :site_id,:product_id, :status, :last_billing_date,:created_at,:udpated_at, :last_billed_date
  self.table_name ='site_products'
  self.primary_key = 'id'

  belongs_to :product , :foreign_key => 'product_id'

end