class Product < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :id,:name, :price, :product_type, :code, :description, :price, :tax, :isActive, :recurring, :recurring_amount
  self.table_name =  'products'
  self.primary_key = 'id'

  PRODUCT_TYPES = ["addon"]
  RECCURING = ["yes", "no"]
  RECCURING_CYCLE = ['1','6','12']

  has_many :siteproducts
end
