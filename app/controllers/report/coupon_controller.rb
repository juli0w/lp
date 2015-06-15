# encoding: UTF-8
class Report::CouponController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin!
  layout 'admin'
  
  def by_coupons
    @coupons = Report::Coupon.by_coupons
  end
  
  def by_coupon
    @coupon = Report::Coupon.by_coupon(params[:id])
  end
end