class Product < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :price, :product_type
end
