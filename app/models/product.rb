class Product < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :price, :product_type, :code, :description, :price, :tax, :isActive, :recurring, :recurring_amount
  set_table_name 'products'
  self.primary_key = 'id'

  PRODUCT_TYPES = ["service", "product","addon"]
  RECCURING = ["yes", "no"]

end
