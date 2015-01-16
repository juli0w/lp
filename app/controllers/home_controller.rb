# encoding: UTF-8
class HomeController < ApplicationController
  def index
    @items = {}

    @items["Novidades"] = Item.last(4)
    @items["Mais vendidos"] = CacheProduct.where("cache_type = 0").last(4).map(&:product)
    @items["Últimos comprados"] = CacheProduct.where("cache_type = 1").last(4).map(&:product)
    @items["Recomendados"] = CacheProduct.where("cache_type = 2").last(4).map(&:product)
  end

  def resicolor
  end

  def metalatex
  end

  def contact
    @message = Message.new
  end
end