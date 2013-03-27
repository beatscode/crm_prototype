class ProductsController < ApplicationController
	def index
		@products = Product.all

		respond_to do |format|
			format.html { render :html => @products }
      		format.json { render :json => @products }
		 end
	end
	def edit
		@product = Product.find(params[:id])
	end
	def new
		@product = Product.new
	end
	def create
		@product = Product.new()
		@product.name = params[:product][:name]
        @product.price = params[:product][:price]
        @product.product_type = params[:product][:product_type]
		@product.save

	 	 respond_to do |format|
      		format.html { redirect_to('/products') }
		 end
	end
end
