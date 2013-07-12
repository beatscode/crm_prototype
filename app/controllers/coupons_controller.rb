class CouponsController < ApplicationController

	def index
		@coupons = Coupon.all
	end

	def new
		@coupon = Coupon.new

	end

	def create
		coupon = Coupon.new
		coupon.name = params[:coupon][:name]
		coupon.code = params[:coupon][:code]
		coupon.discount = params[:coupon][:discount]
		coupon.description = params[:coupon][:description]

		respond_to do |format|
			format.html { render :html => @coupon }
      		format.json { render :json => @coupon }
		 end

	end

	def edit
		@coupons = Coupon.find(params[:id])
	end

	def update
		@coupon = Coupon.find(params[:reseller][:id])
		@coupon.update_attributes(params[:coupon])
	end
end