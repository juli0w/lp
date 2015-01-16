class ProductSize < ActiveRecord::Base
  self.table_name = :products_sizes

  attr_accessible :price, :size_id, :product_id

  belongs_to :product
  belongs_to :size
end