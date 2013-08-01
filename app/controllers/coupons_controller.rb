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
		coupon.start_date = params[:coupon][:start_date]
		coupon.end_date = params[:coupon][:end_date]
		coupon.status = 'active'
		coupon.save

		respond_to do |format|
			format.html { render :html => @coupon }
      		format.json { render :json => @coupon }
		 end

	end

	def edit
		@coupon = Coupon.find(params[:id])

		respond_to do |format|
			format.html { render :html => @coupon }
      		format.json { render :json => @coupon }
		 end

	end

	def update
		@coupon = Coupon.find(params[:id])
		@coupon.update_attributes(params[:coupon])
	end
end