class PurchaseItem < ActiveRecord::Base
  attr_accessible :price, :product_id, :purchase_id, :quantity

  belongs_to :product
  belongs_to :purchase

  def total
    self.price.to_f * self.quantity.to_f
  end
end
