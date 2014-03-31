# encoding: UTF-8
class HomeController < ApplicationController
  def index
    @products = {}

    @products["Mais vendidos"] = CacheProduct.where("cache_type = 0").last(4).map(&:product)
    @products["Últimos comprados"] = CacheProduct.where("cache_type = 1").last(4).map(&:product)
    @products["Recomendados"] = CacheProduct.where("cache_type = 2").last(4).map(&:product)
    @products["Novidades"] = Product.last(4)
  end

  def resicolor
  end

  def metalatex
  end

  def contact
    @message = Message.new
  end
end