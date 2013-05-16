class Invoicedetail < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :invoice_id,:product_id,:discount,:cost,:description,:quantity,:coupon_id
  set_table_name 'invoice_details'

  belongs_to :invoice, :class_name => "Invoice",
   :foreign_key => "id"
end
