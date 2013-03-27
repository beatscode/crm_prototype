class CouponsController < ApplicationController

	def index
		@coupons = Coupon.all
	end

	def create

	end

	def edit
		@coupons = Coupon.find(params[:id])
	end

	def update
		@coupon = Coupon.find(params[:reseller][:id])
		@coupon.update_attributes(params[:coupon])
	end
end