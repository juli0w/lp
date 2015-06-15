# encoding: UTF-8
class CouponsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin!
  layout 'admin'

  def index
    @coupons = Coupon.page(params[:page])
  end
  
  def importation
  end

  def import
    Coupon.from_csv(params[:csv])
    redirect_to coupons_path, notice: "Páginas importadas"
  end

  def show
    @coupon = Coupon.where(id: params[:id])
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(params[:coupon])

    respond_to do |format|
      if @coupon.save
        format.html { redirect_to coupons_path, notice: 'Cupom criado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @coupon = Coupon.find(params[:id])
  end

  def update
    @coupon = Coupon.find(params[:id])

    respond_to do |format|
      if @coupon.update_attributes(params[:coupon])
        format.html { redirect_to coupons_path, notice: 'Cupom atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.active = false
    @coupon.save

    redirect_to coupons_path
  end
end