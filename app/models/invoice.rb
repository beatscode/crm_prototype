class Invoice < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :user_id, :total,:site_id, :product_id, :invoice_status, :invoice_type, :invoice_note
  set_table_name 'invoices'
  self.primary_key = 'id'

  has_many :invoicedetail, :class_name => "Invoicedetail",
  :foreign_key => "invoice_id"

  belongs_to :site, :class_name => "Site",
   :foreign_key => "site_id"

end