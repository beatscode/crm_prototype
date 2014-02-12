class CouponsController < ApplicationController

	before_filter :authenticate_user 
	def index
		@coupons = Coupon.all
	end

	def new
		@discount_type = Coupon::DISCOUNT_TYPE
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
		coupon.status = params[:coupon][:status]
		coupon.site_type_id = params[:coupon][:site_type_id]
		coupon.discount_type = params[:coupon][:discount_type]
		coupon.save

		respond_to do |format|
			format.html { render :html => @coupon }
      		format.json { render :json => @coupon }
		 end
	end

	def delete
		@coupon = Coupon.find(params[:id])
		@coupon.delete
		redirect = '/coupons/'
		respond_to do |format|
      		format.html { redirect_to(redirect) }
		 end
	end

	def edit
		@coupon = Coupon.find(params[:id])
		respond_to do |format|
			format.html { render :html => @coupon }
      		format.json { render :json => @coupon }
		 end
	end

	def updateCoupon
		coupon = Coupon.find(params[:coupon][:id])
		coupon.name = params[:coupon][:name]
		coupon.code = params[:coupon][:code]
		coupon.discount = params[:coupon][:discount]
		coupon.description = params[:coupon][:description]
		coupon.start_date = params[:coupon][:start_date]
		coupon.end_date = params[:coupon][:end_date]
		coupon.status = params[:coupon][:status]
		coupon.site_type_id = params[:coupon][:site_type_id]
		coupon.discount_type = params[:coupon][:discount_type]
		coupon.save

		 redirect = '/coupons/'
		 respond_to do |format|
      		format.html { redirect_to(redirect) }
		 end
	end

	def update
		@coupon = Coupon.find(params[:id])
		@coupon.update_attributes(params[:coupon])
	end
	
end