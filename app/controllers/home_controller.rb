class HomeController < ApplicationController
  def index
    @products = Product.order(params[:order] || :name).page(params[:page]).per(20)
  end
end