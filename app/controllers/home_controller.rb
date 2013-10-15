class HomeController < ApplicationController
  def index
    @products = Product.order(params[:order] || :name).page(params[:page]).per(params[:show] || 20)
  end
end