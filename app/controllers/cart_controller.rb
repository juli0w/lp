class CartController < ApplicationController
  def index
  end

  def clean
    session[:cart] = nil
    redirect_to cart_index_path
  end
end