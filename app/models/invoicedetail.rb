class Invoicedetail < ActiveRecord::Base
  
  attr_accessible :invoice_id,:product_id,:discount,:cost,:description,:quantity,:coupon_id, :invoice_id
  self.table_name = 'invoice_details'

  belongs_to :invoice, :class_name => "Invoice",
   :foreign_key => "id"
end
