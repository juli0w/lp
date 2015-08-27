# encoding: UTF-8
class HomeController < ApplicationController
  def index
    @items = {}

    @items["Recomendados"] = CacheProduct.where("cache_type = 2").map(&:item)
    @items["Mais vendidos"] = CacheProduct.where("cache_type = 0").map(&:item)
    @items["Últimos comprados"] = CacheProduct.where("cache_type = 1").map(&:item)
    @items["Novidades"] = Item.last(15)
  end

  def resicolor
  end

  def metalatex
  end

  def contact
    @message = Message.new
  end
end