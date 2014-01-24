class Invoice < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :user_id, :total,:site_id, :product_id, :invoice_status, :invoice_type, :invoice_note, :paid_date, :due_date, :discount_applied, :discount_coupon_id, :discount_amount, :price_before_discount
  self.table_name = 'invoices'
  self.primary_key = 'id'

  has_many :invoicedetail, :class_name => "Invoicedetail",
  :foreign_key => "invoice_id"

  belongs_to :site, :class_name => "Site",
   :foreign_key => "site_id"

    has_many :users, :class_name => "User",
  :foreign_key => "id"

end
