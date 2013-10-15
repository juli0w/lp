# encoding: UTF-8
class PurchasesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin!, except: [:show, :index]
  layout 'dashboard'

  def show
    if current_user.admin?
      @purchase = Purchase.find(params[:id])
    else
      @purchase = current_user.purchases.find(params[:id])
    end
  end

  def index
    @purchases = current_user.purchases.page(params[:page])
  end

  def list
  end

  [:open, :paid, :sent, :canceled].each_with_index do |method, index|
    define_method method do
      @kind = Purchase::STATES[index]
      @purchases = Purchase.send(method).page(params[:page])

      render :list, layout: 'admin'
    end
  end

  def change
    @purchase = Purchase.find(params[:id])

    if (0..3).include? params[:state].to_i
      @purchase.update_state(params[:state])
    end

    redirect_to @purchase, notice: 'Pedido alterado com sucesso.'
  end
end
