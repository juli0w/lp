# encoding: UTF-8
class HomeController < ApplicationController
  def index
    raise "teste"
    @items = {}

    @items["Novidades"] = Item.last(4)
    @items["Mais vendidos"] = CacheProduct.where("cache_type = 0").last(4).map(&:item)
    @items["Últimos comprados"] = CacheProduct.where("cache_type = 1").last(4).map(&:item)
    @items["Recomendados"] = CacheProduct.where("cache_type = 2").last(4).map(&:item)
  end

  def resicolor
  end

  def metalatex
  end

  def contact
    @message = Message.new
  end
end