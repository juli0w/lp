# encoding: UTF-8
class CacheProduct < ActiveRecord::Base
  attr_accessible :cache_type, :product_id

  belongs_to :product

  TYPES = {
    "Mais vendidos" => 0,
    "Últimos comprados" => 1,
    "Recomendados" => 2
  }

  def type_name
    TYPES.each do |name, type|
      return name if type.to_i == self.cache_type.to_i
    end
  end
end
